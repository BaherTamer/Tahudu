//
//  GetFavoritesUseCase.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

protocol GetFavoritesUseCase {
    func execute() -> Set<String>
}

final class GetFavoritesUseCaseImp: GetFavoritesUseCase {
    // MARK: - Dependencies
    private let repository: FavoritesRepository

    // MARK: - Life Cycle
    init(repository: FavoritesRepository) {
        self.repository = repository
    }
}

// MARK: - Core Functions
extension GetFavoritesUseCaseImp {
    func execute() -> Set<String> {
        repository.getFavoriteIDs()
    }
}
