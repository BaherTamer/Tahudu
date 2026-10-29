//
//  SwiftUIView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import DesignModule
import SwiftUI

struct MediaCarouselView: View {
    // MARK: - Inputs
    let media: [String]
    
    // MARK: - Body
    var body: some View {
        carouselView
            .frame(maxWidth: .infinity)
            .frame(height: 228)
    }
}

// MARK: - Components
extension MediaCarouselView {
    @ViewBuilder
    private var carouselView: some View {
        if media.isEmpty {
            placeholderImage
        } else {
            mediaView
        }
    }

    private var mediaView: some View {
        TabView {
            ForEach(
                media,
                id: \.self,
                content: pageImage
            )
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }

    private func pageImage(_ mediaItem: String) -> some View {
        Image(mediaItem, bundle: .designModule)
            .resizable()
            .scaledToFill()
            .clipped()
    }

    private var placeholderImage: some View {
        Image(systemName: "photo")
            .font(.largeTitle)
            .foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
    }
}
