//
//  ListingsRepositoryImp.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import NetworkModule

final class ListingsRepositoryImp: ListingsRepository {
    // MARK: - Dependencies
    private let networkService: NetworkService

    // MARK: - Life Cycle
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

// MARK: - Core Functions
extension ListingsRepositoryImp {
    func getListings() async throws -> [Listing] {
        do {
            let data = try await networkService.request(with: ListingsEndpoint())
            let response = try data.decode(ListingsDTO.self)
            return response.toDomain()
        } catch let error as NetworkError {
            throw mapError(error)
        } catch {
            throw SearchError.serviceUnavailable
        }
    }
}

// MARK: - Private Helpers
extension ListingsRepositoryImp {
    private func mapError(_ error: NetworkError) -> SearchError {
        switch error {
        case .noConnection:
            .noInternet
        case .invalidURL, .transportFailure, .unacceptableStatus:
            .serviceUnavailable
        }
    }
}
