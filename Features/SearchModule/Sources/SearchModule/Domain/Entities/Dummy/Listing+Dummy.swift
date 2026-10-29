//
//  Listing+Dummy.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

extension Listing {
    static let dummy = Listing(
        id: "prop_001",
        type: "Apartment",
        deliveryYear: 2022,
        price: 2_575_000,
        currency: "AED",
        bedrooms: .studio,
        publishedAt: .now.addingTimeInterval(-3 * 24 * 60 * 60),
        lastContactedAt: .now.addingTimeInterval(-365 * 24 * 60 * 60),
        tags: [.verified],
        imageNames: ["FirstImage", "SecondImage"],
        contactOptions: [.phone, .email, .whatsApp]
    )

    static let dummyList: [Listing] = [
        dummy,
        Listing(
            id: "prop_002",
            type: "Apartment",
            deliveryYear: 2023,
            price: 1_850_000,
            currency: "AED",
            bedrooms: .count(1),
            publishedAt: .now.addingTimeInterval(-24 * 60 * 60),
            lastContactedAt: nil,
            tags: [.verified, .newConstruction],
            imageNames: ["SecondImage", "FirstImage"],
            contactOptions: [.phone, .whatsApp]
        ),
    ]
}
