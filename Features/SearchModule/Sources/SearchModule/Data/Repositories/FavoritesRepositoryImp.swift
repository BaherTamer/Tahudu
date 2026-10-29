//
//  FavoritesRepositoryImp.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

final class FavoritesRepositoryImp: FavoritesRepository {
    // MARK: - Dependencies
    private let defaults: UserDefaults

    // MARK: - Constants
    private let key = "favoriteListingIDs"

    // MARK: - Life Cycle
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
}

// MARK: - Core Functions
extension FavoritesRepositoryImp {
    func getFavoriteIDs() -> Set<String> {
        Set(defaults.stringArray(forKey: key) ?? [])
    }

    func toggleFavorite(_ isFavorite: Bool, id: String) {
        var favoriteIDs = getFavoriteIDs()
        if isFavorite {
            favoriteIDs.insert(id)
        } else {
            favoriteIDs.remove(id)
        }
        defaults.set(favoriteIDs.sorted(), forKey: key)
    }
}
