//
//  CourseListViewModel.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(String)
}

@MainActor
final class CourseListViewModel: ObservableObject {

    // MARK: - Published Properties
    @Published private(set) var courses: [Course] = []
    @Published private(set) var viewState: ViewState = .idle
    @Published var searchText: String = ""

    // MARK: - Private
    private let service: CourseServiceProtocol
    private var cache: [Course]? = nil

    // MARK: - Computed
    var filteredCourses: [Course] {
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
            return courses
        }
        return courses.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    var isEmpty: Bool {
        filteredCourses.isEmpty
    }

    // MARK: - Init
    init(service: CourseServiceProtocol = CourseService()) {
        self.service = service
    }

    // MARK: - Fetch
    func fetchCourses(forceRefresh: Bool = false) async {
        if let cached = cache, !forceRefresh {
            courses = cached
            viewState = .success
            return
        }
        
        if courses.isEmpty {
            viewState = .loading
        }
        do {
            let result = try await service.fetchCourses()
            courses = result
            cache = result
            viewState = .success
        } catch {
            viewState = .error(error.localizedDescription)
        }
    }
}
