//
//  SearchHeaderView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct SearchHeaderView<ViewModel: SearchViewModel>: View {
    // MARK: - Environments
    @EnvironmentObject private var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            actionsBar
            searchField
        }
        .padding(.horizontal)
        .padding(.bottom)
        .background(headerBackground)
    }
}

// MARK: - Components
extension SearchHeaderView {
    private var actionsBar: some View {
        HStack {
            filtersButton
            sortButton
            Spacer()
            saveButton
        }
    }
    
    private var searchField: some View {
        ClearableTextField(
            label: "City, area or building",
            symbol: "magnifyingglass",
            text: $viewModel.searchText
        )
        .font(.caption)
    }
    
    private var headerBackground: some View {
        Color(.systemBackground)
            .ignoresSafeArea(edges: .top)
    }
}

// MARK: - Buttons
extension SearchHeaderView {
    private var filtersButton: some View {
        SearchHeaderButton(
            systemName: "slider.horizontal.3",
            action: viewModel.didTapFilters
        )
    }
    
    private var sortButton: some View {
        SearchHeaderButton(
            systemName: "arrow.up.arrow.down",
            action: viewModel.didTapSort
        )
    }
    
    private var saveButton: some View {
        SearchHeaderButton(
            systemName: "star",
            action: viewModel.didTapSaveSearch
        )
    }
}
