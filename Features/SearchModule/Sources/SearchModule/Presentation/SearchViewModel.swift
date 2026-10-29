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
}

final class SearchViewModelImp: SearchViewModel {
    // MARK: - States
    @Published var searchText = ""
    @Published private(set) var state: ViewState = .initial
    @Published private(set) var listings: [Listing] = []
    
    // MARK: - Dependencies
    private let getListingsUseCase: GetListingsUseCase

    // MARK: - Life Cycle
    init(
        getListingsUseCase: GetListingsUseCase
    ) {
        self.getListingsUseCase = getListingsUseCase
    }
}

// MARK: - Base Functions
extension SearchViewModelImp {
    func onInit() async {
        guard state == .initial else { return }
        await getListings(showsLoading: true)
    }

    func onRefresh() async {
        await getListings(showsLoading: false)
    }

    func onRetry() async {
        await getListings(showsLoading: true)
    }
}

// MARK: - Private Helpers
extension SearchViewModelImp {
    private func getListings(showsLoading: Bool) async {
        if showsLoading {
            state = .loading
        }
        do {
            listings = try await getListingsUseCase.execute()
            state = listings.isEmpty ? .empty : .loaded
        } catch let error as SearchError {
            state = .error(error.message)
        } catch {
            state = .error(SearchError.serviceUnavailable.message)
        }
    }
}
