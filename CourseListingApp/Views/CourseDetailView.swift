//
//  CourseDetailView.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import SwiftUI

struct CourseDetailView: View {
    let course: Course

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Header card
                VStack(alignment: .leading, spacing: 12) {
                    Label("Course \(course.id)", systemImage: "book.closed.fill")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white.opacity(0.8))
                        .textCase(.uppercase)
                        .tracking(0.8)

                    Text(course.title.capitalized)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .background(
                    LinearGradient(
                        colors: [Color.accentColor, Color.accentColor.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)

                // Author info
                HStack(spacing: 12) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(Color.accentColor)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Instructor")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("Author ID: \(course.userId)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }

                    Spacer()
                }
                .padding(.horizontal)

                Divider()
                    .padding(.horizontal)

                // Description section
                VStack(alignment: .leading, spacing: 10) {
                    Text("About this Course")
                        .font(.headline)
                        .padding(.horizontal)

                    Text(course.body.capitalized)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineSpacing(6)
                        .padding(.horizontal)
                }

                Spacer(minLength: 32)
            }
            .padding(.top, 16)
        }
        .navigationTitle("Course Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CourseDetailView(course: Course(id: 1, userId: 1, title: "Ayush", body: "Hello"))
}
