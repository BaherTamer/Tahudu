//
//  FavoritesRepository.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

protocol FavoritesRepository {
    func getFavoriteIDs() -> Set<String>
    func toggleFavorite(_ isFavorite: Bool, id: String)
}
