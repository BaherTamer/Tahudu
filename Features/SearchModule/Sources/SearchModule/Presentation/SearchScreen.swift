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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
