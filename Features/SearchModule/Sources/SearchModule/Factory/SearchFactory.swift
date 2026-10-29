//
//  SearchFactory.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import NetworkModule
import SwiftUI

public enum SearchFactory {
    @MainActor
    public static func makeScreen() -> some View {
        SearchScreen(
            viewModel: makeViewModel()
        )
    }
}

// MARK: - ViewModels
extension SearchFactory {
    @MainActor
    private static func makeViewModel() -> SearchViewModelImp {
        let networkService = NetworkFactory.networkService
        let favoritesRepository = makeFavoritesRepository()
        return SearchViewModelImp(
            getListingsUseCase: makeGetListingsUseCase(networkService: networkService),
            getFavoritesUseCase: makeGetFavoritesUseCase(repository: favoritesRepository),
            toggleFavoriteUseCase: makeToggleFavoriteUseCase(repository: favoritesRepository)
        )
    }
}

// MARK: - UseCases
extension SearchFactory {
    private static func makeGetListingsUseCase(
        networkService: NetworkService
    ) -> GetListingsUseCase {
        GetListingsUseCaseImpl(
            repository: makeListingsRepository(networkService: networkService)
        )
    }
    
    private static func makeGetFavoritesUseCase(
        repository: FavoritesRepository
    ) -> GetFavoritesUseCase {
        GetFavoritesUseCaseImp(repository: repository)
    }

    private static func makeToggleFavoriteUseCase(
        repository: FavoritesRepository
    ) -> ToggleFavoriteUseCase {
        ToggleFavoriteUseCaseImp(repository: repository)
    }
}

// MARK: - Repositories
extension SearchFactory {
    private static func makeListingsRepository(
        networkService: NetworkService
    ) -> ListingsRepository {
        ListingsRepositoryImp(
            networkService: networkService
        )
    }
    
    private static func makeFavoritesRepository() -> FavoritesRepository {
        FavoritesRepositoryImp()
    }
}
