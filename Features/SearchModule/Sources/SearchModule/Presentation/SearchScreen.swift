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
        ScrollView(showsIndicators: false) {
            stateView
        }
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
    private var stateView: some View {
        switch viewModel.state {
        case .initial:
            Color.clear
                .onAppear(perform: viewModel.onInit)
        case .loading:
            loadingView
        case .loaded:
            contentView
        case .empty:
            emptyView
        case .error(let message):
            errorView(message: message)
        }
    }

    private var loadingView: some View {
        ProgressView()
    }

    private var emptyView: some View {
        StateScreen(
            systemImage: "house",
            title: "No listings yet",
            message: "Pull down to check again."
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
    private var contentView: some View {
        LazyVStack {
            ForEach(
                viewModel.listings,
                content: ListingCardView<ViewModel>.init
            )
        }
        .padding(.horizontal)
    }
}
