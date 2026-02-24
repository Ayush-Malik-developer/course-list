//
//  CourseRowView.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import SwiftUI

struct CourseRowView: View {
    let course: Course

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Course \(course.id)")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .textCase(.uppercase)
                .tracking(0.8)

            Text(course.title.capitalized)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text(course.body)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            HStack(spacing: 4) {
                Image(systemName: "person.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                Text("Author \(course.userId)")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            .padding(.top, 2)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CourseRowView(course: Course(id: 1, userId: 1, title: "Ayush", body: "Hello"))
}
