//
//  LoadingUIView.swift
//  CourseListingApp
//
//  Created by Ayush Malik on 24/02/26.
//

import SwiftUI

struct LoadingUIView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.2)
            Text("Loading Courses...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingUIView()
}
