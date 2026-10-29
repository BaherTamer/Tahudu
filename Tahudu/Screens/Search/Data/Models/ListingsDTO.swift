//
//  ListingsDTO.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import CoreModule

struct ListingsDTO: Domainable {
    let listings: [ListingDTO]?
}

// MARK: - Mapping Functions
extension ListingsDTO {
    func toDomain() -> [Listing] {
        (listings ?? []).compactMap {
            $0.toDomain()
        }
    }
}
