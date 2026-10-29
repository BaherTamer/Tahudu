//
//  SearchViewModel.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import CoreModule
import Foundation

protocol SearchViewModel: ViewModel {
    var searchText: String { get set }
    var listings: [Listing] { get }
    var placeholders: [Listing] { get }
    var isFavoritesFilterOn: Bool { get }
    
    func isFavorite(id: String) -> Bool
    
    func didTapFilters()
    func didTapSort()
    func didTapFavorite(id: String)
    func didTapFavoritesFilter()
    func didTapContact(_ type: ContactType, id: String)
}

final class SearchViewModelImp: SearchViewModel {
    // MARK: - States
    @Published var searchText = ""
    @Published private(set) var state: ViewState = .initial
    @Published private(set) var isFavoritesFilterOn = false
    @Published private var favoriteIDs: Set<String> = []
    @Published private var allListings: [Listing] = []
    
    // MARK: - Variables
    let placeholders = Listing.dummyList
    var listings: [Listing] {
        guard isFavoritesFilterOn else { return allListings }
        return allListings.filter { favoriteIDs.contains($0.id) }
    }
    
    // MARK: - Dependencies
    private let getListingsUseCase: GetListingsUseCase
    private let getFavoritesUseCase: GetFavoritesUseCase
    private let toggleFavoriteUseCase: ToggleFavoriteUseCase

    // MARK: - Life Cycle
    init(
        getListingsUseCase: GetListingsUseCase,
        getFavoritesUseCase: GetFavoritesUseCase,
        toggleFavoriteUseCase: ToggleFavoriteUseCase,
    ) {
        self.getListingsUseCase = getListingsUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
        self.toggleFavoriteUseCase = toggleFavoriteUseCase
    }
}

// MARK: - Base Functions
extension SearchViewModelImp {
    func onInit() {
        guard state == .initial else { return }
        Task { [weak self] in
            self?.favoriteIDs = self?.getFavoritesUseCase.execute() ?? []
            await self?.getListings(showsLoading: true)
        }
    }

    func onRefresh() async {
        await getListings(showsLoading: false)
    }

    func onRetry() {
        Task { [weak self] in
            await self?.getListings(showsLoading: true)
        }
    }
}

// MARK: - Core Functions
extension SearchViewModelImp {
    func isFavorite(id: String) -> Bool {
        favoriteIDs.contains(id)
    }
    
    func didTapFilters() {
        print("Filters tapped")
    }
    
    func didTapSort() {
        print("Sort tapped")
    }
    
    func didTapFavorite(id: String) {
        if toggleFavoriteUseCase.execute(id: id) {
            favoriteIDs.insert(id)
        } else {
            favoriteIDs.remove(id)
        }
    }
    
    func didTapFavoritesFilter() {
        isFavoritesFilterOn.toggle()
    }
    
    func didTapContact(_ type: ContactType, id: String) {
        print("Contact \(type) tapped for listing \(id)")
    }
}

// MARK: - Private Helpers
extension SearchViewModelImp {
    private func getListings(showsLoading: Bool) async {
        if showsLoading {
            state = .loading
        }
        do {
            allListings = try await getListingsUseCase.execute()
            state = listings.isEmpty ? .empty : .loaded
        } catch let error as SearchError {
            state = .error(error.message)
        } catch {
            state = .error(SearchError.serviceUnavailable.message)
        }
    }
}
