//
//  ListingCardView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct ListingCardView<ViewModel: SearchViewModel>: View {
    // MARK: - Inputs
    let listing: Listing
    
    // MARK: - Environments
    @EnvironmentObject private var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            
        }
        .background(Color(.systemBackground))
        .roundedBorder(radius: 8)
    }
}
