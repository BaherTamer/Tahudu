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
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            mediaCarousel
            detailsView
            Divider()
            actionsView
            lastContactedView
        }
        .background(Color(.systemBackground))
        .roundedBorder(radius: 8)
    }
}

// MARK: - Components
extension ListingCardView {
    private var mediaCarousel: some View {
        MediaCarouselView(
            media: listing.imageNames
        )
        .overlay(
            alignment: .topLeading,
            content: tagsView
        )
    }
    
    private func tagsView() -> some View {
        TagsView(tags: listing.tags)
            .padding(12)
    }
    
    private var detailsView: some View {
        ListingDetailsView(listing: listing)
            .padding(16)
    }
    
    private var actionsView: some View {
        ListingActionsView<ViewModel>(
            listingId: listing.id,
            published: listing.publishedAt,
            contactOptions: listing.contactOptions
        )
        .padding()
    }
    
    @ViewBuilder
    private var lastContactedView: some View {
        if let lastContacted = listing.lastContactedAt {
            LastContactedView(date: lastContacted)
        }
    }
}
