//
//  SearchViewModel.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import CoreModule
import Foundation

protocol SearchViewModel: ViewModel {
    
}

final class SearchViewModelImp: SearchViewModel {
    // MARK: - States
    @Published private(set) var state: ViewState = .initial

    // MARK: - Life Cycle
    init() {
        
    }
}

// MARK: - Base Functions
extension SearchViewModelImp {
    func onInit() {
        guard state == .initial else { return }
        
    }

    func onRefresh() async {
        
    }

    func onRetry() {
        
    }
}
