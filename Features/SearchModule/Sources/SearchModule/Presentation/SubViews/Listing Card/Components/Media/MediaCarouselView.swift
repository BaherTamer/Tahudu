//
//  SwiftUIView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

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
            ImagePlaceholderView()
        } else {
            mediaTabs
        }
    }

    private var mediaTabs: some View {
        TabView {
            ForEach(
                media,
                id: \.self,
                content: ImageView.init
            )
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}
