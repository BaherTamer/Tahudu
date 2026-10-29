//
//  ListingActionsView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct ListingActionsView<ViewModel: SearchViewModel>: View {
    // MARK: - Inputs
    let listingId: String
    let published: Date?
    let contactOptions: [ContactType]
    
    // MARK: - Body
    var body: some View {
        HStack {
            publishedView
            Spacer()
            contactsList
        }
    }
}

// MARK: - Components
extension ListingActionsView {
    @ViewBuilder
    private var publishedView: some View {
        if let published {
            PublishedView(published: published)
        }
    }
    
    private var contactsList: some View {
        ContactsView<ViewModel>(
            listingId: listingId,
            contactOptions: contactOptions
        )
    }
}
