//
//  GetListingsUseCase.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

protocol GetListingsUseCase {
    func execute() async throws -> [Listing]
}

final class GetListingsUseCaseImpl: GetListingsUseCase {
    // MARK: - Dependencies
    private let repository: ListingsRepository

    // MARK: - Life Cycle
    init(repository: ListingsRepository) {
        self.repository = repository
    }
}

// MARK: - Core Functions
extension GetListingsUseCaseImpl {
    func execute() async throws -> [Listing] {
        try await repository.getListings()
    }
}
