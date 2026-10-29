//
//  ListingsRepository.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

protocol ListingsRepository: Sendable {
    func getListings() async throws -> [Listing]
}
