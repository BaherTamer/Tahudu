//
//  ListingTag.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

enum ListingTag: String {
    case verified
    case newConstruction = "new_construction"
    case liveViewing = "live_viewing"
    case furnished
    case priceReduced = "price_reduced"
    case seaView = "sea_view"
    case exclusive
    case cornerUnit = "corner_unit"
    case highFloor = "high_floor"
}

// MARK: - Presentation
extension ListingTag {
    var title: String {
        rawValue
            .replacingOccurrences(of: "_", with: " ")
            .uppercased()
    }

    var backgroundColor: Color {
        switch self {
        case .verified:
            .success
        case .priceReduced, .exclusive:
            .brand
        case .newConstruction, .liveViewing, .furnished, .seaView, .cornerUnit, .highFloor:
            .accentColor
        }
    }
}
