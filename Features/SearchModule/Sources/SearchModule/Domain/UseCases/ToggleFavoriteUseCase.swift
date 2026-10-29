//
//  ToggleFavoriteUseCase.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

protocol ToggleFavoriteUseCase {
    /// Returns the new state.
    func execute(id: String) -> Bool
}

final class ToggleFavoriteUseCaseImp: ToggleFavoriteUseCase {
    // MARK: - Dependencies
    private let repository: FavoritesRepository

    // MARK: - Life Cycle
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
}

// MARK: - Core Functions
extension ToggleFavoriteUseCaseImp {
    func execute(id: String) -> Bool {
        let isFavorite = !repository.getFavoriteIDs().contains(id)
        repository.toggleFavorite(isFavorite, id: id)
        return isFavorite
    }
}
