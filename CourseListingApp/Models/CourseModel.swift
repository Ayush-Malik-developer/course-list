//
//  CourseModel.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import Foundation

struct Course: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
