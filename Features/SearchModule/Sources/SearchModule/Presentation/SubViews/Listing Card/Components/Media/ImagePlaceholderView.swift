//
//  ImagePlaceholderView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct ImagePlaceholderView: View {
    // MARK: - Body
    var body: some View {
        Image(systemName: "photo")
            .font(.largeTitle)
            .foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
    }
}
