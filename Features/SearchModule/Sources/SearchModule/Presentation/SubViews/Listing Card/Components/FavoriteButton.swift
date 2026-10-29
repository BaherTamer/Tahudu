//
//  FavoriteButton.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import DesignModule
import SwiftUI

struct FavoriteButton<ViewModel: SearchViewModel>: View {
    // MARK: - Inputs
    let listingId: String
    
    // MARK: - Environments
    @EnvironmentObject private var viewModel: ViewModel
    
    // MARK: - Variables
    private var isFavorite: Bool {
        viewModel.isFavorite(id: listingId)
    }

    // MARK: - Body
    var body: some View {
        Button(
            action: favoriteAction,
            label: heartImage
        )
    }
}

// MARK: - Components
extension FavoriteButton {
    private func heartImage() -> some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .font(.title3)
            .foregroundStyle(isFavorite ? Color.brand : .white)
            .frame(width: 44, height: 44)
            .background(Color.black.opacity(0.4), in: .circle)
    }
}

// MARK: - Private Helpers
extension FavoriteButton {
    private func favoriteAction() {
        viewModel.didTapFavorite(id: listingId)
    }
}
