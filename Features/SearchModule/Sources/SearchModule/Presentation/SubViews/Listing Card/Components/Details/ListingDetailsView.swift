//
//  ListingDetailsView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct ListingDetailsView: View {
    // MARK: - Inputs
    let listing: Listing

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            PriceView(price: listing.price, currency: listing.currency)
            BedroomsView(bedrooms: listing.bedrooms)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Components
extension ListingDetailsView {
    private var headerView: some View {
        HStack(spacing: 8) {
            TypeView(type: listing.type)
            deliveryChip
        }
    }

    @ViewBuilder
    private var deliveryChip: some View {
        if let year = listing.deliveryYear {
            DeliveryYearView(year: year)
        }
    }
}
