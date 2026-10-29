//
//  ListingDTO.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import CoreModule
import Foundation

struct ListingDTO: Domainable {
    let id: String?
    let type: String?
    let deliveryYear: Int?
    let price: Int?
    let currency: String?
    let bedrooms: Int?
    let publishedAt: Date?
    let lastContactedAt: Date?
    let tags: [String]?
    let images: [String]?
    let contactOptions: [String]?
}

// MARK: - Mapping Functions
extension ListingDTO {
    func toDomain() -> Listing? {
        guard let id else { return nil }
        let bedrooms = bedrooms.map(Bedrooms.count) ?? .studio
        let tags = tags?.compactMap(ListingTag.init(rawValue:)) ?? []
        let contactOptions = contactOptions?.compactMap(ContactType.init(rawValue:))  ?? []
        return Listing(
            id: id,
            type: type ?? "N/A",
            deliveryYear: deliveryYear,
            price: price ?? 0,
            currency: currency ?? "",
            bedrooms: bedrooms,
            publishedAt: publishedAt,
            lastContactedAt: lastContactedAt,
            tags: tags,
            imageNames: images ?? [],
            contactOptions: contactOptions
        )
    }
}
