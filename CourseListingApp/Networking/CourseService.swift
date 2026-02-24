//
//  CourseService.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import Foundation

protocol CourseServiceProtocol {
    func fetchCourses() async throws -> [Course]
}

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL:       return "Invalid URL."
        case .invalidResponse:  return "Invalid server response."
        case .decodingError:    return "Failed to decode data."
        case .serverError(let code): return "Server error with status code \(code)."
        }
    }
}

final class CourseService: CourseServiceProtocol {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func fetchCourses() async throws -> [Course] {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode([Course].self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
