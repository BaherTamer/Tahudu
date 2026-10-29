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
        return SearchViewModelImp()
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
}
