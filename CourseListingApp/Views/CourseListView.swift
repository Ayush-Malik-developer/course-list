//
//  CourseListView.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .idle, .loading:
                    LoadingUIView()

                case .error(let message):
                    ErrorView(message: message) {
                        Task { await viewModel.fetchCourses(forceRefresh: true) }
                    }

                case .success:
                    courseContent
                }
            }
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search courses..."
            )
            .navigationTitle("Courses")
            .task {
                await viewModel.fetchCourses()
            }
        }
    }

    @ViewBuilder
    private var courseContent: some View {
        if viewModel.isEmpty {
            EmptyStateView(searchText: viewModel.searchText)
        } else {
            List(viewModel.filteredCourses) { course in
                NavigationLink(destination: CourseDetailView(course: course)) {
                    CourseRowView(course: course)
                }
            }
            .listStyle(.insetGrouped)
            .refreshable {
                await viewModel.fetchCourses(forceRefresh: true)
            }
        }
    }
}

#Preview {
    CourseListView()
}
