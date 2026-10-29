//
//  Listing.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

struct Listing: Hashable, Identifiable {
    let id: String
    let type: String
    let deliveryYear: Int?

    let price: Int
    let currency: String

    let bedrooms: Bedrooms
    let publishedAt: Date?
    let lastContactedAt: Date?

    let tags: [ListingTag]
    let imageNames: [String]
    let contactOptions: [ContactType]
}
