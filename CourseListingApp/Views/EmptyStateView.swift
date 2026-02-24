//
//  EmptyStateView.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import SwiftUI

struct EmptyStateView: View {
    let searchText: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)

            Text("No results for \"\(searchText)\"")
                .font(.headline)

            Text("Try searching with a different keyword.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    EmptyStateView(searchText: "")
}
