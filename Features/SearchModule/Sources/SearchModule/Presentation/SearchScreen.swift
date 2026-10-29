//
//  SearchScreen.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct SearchScreen<ViewModel: SearchViewModel>: View {
    // MARK: - Dependencies
    @StateObject private var viewModel: ViewModel

    // MARK: - Life Cycle
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Body
    var body: some View {
        ScrollView(
            content: stateView
        )
        .safeAreaInset(
            edge: .top,
            spacing: .zero,
            content: SearchHeaderView<ViewModel>.init
        )
        .environmentObject(viewModel)
        .refreshable(action: viewModel.onRefresh)
    }
}

// MARK: - State Views
extension SearchScreen {
    @ViewBuilder
    private func stateView() -> some View {
        switch viewModel.state {
        case .initial:
            initialView
        case .loaded where viewModel.listings.isEmpty:
            favoritesEmptyView
        case .loading, .loaded:
            contentView(isLoading: viewModel.state == .loading)
        case .empty:
            emptyView
        case .error(let message):
            errorView(message: message)
        }
    }

    private var initialView: some View {
        Color.clear
            .onAppear(perform: viewModel.onInit)
    }

    private var emptyView: some View {
        StateScreen(
            systemImage: "house",
            title: "No listings yet",
            message: "Pull down to check again."
        )
    }

    private var favoritesEmptyView: some View {
        StateScreen(
            systemImage: "heart",
            title: "No favourites yet",
            message: "Tap the heart on a listing to save it here.",
            actionTitle: "Show all listings",
            action: viewModel.didTapFavoritesFilter
        )
    }

    private func errorView(message: String) -> some View {
        StateScreen(
            systemImage: "exclamationmark.triangle",
            title: "Something went wrong",
            message: message,
            actionTitle: "Try again",
            action: viewModel.onRetry
        )
    }
}

// MARK: - Components
extension SearchScreen {
    private func contentView(isLoading: Bool) -> some View {
        LazyVStack {
            ForEach(
                isLoading ? viewModel.placeholders : viewModel.listings,
                content: ListingCardView<ViewModel>.init
            )
        }
        .padding(.horizontal)
        .shimmering(isLoading)
    }
}
