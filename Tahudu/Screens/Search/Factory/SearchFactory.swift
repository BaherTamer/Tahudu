//
//  SearchFactory.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import NetworkModule

public enum SearchFactory {
    
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
