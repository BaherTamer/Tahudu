//
//  Bedrooms.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

enum Bedrooms: Hashable {
    case studio
    case count(Int)
}

// MARK: - Presentation
extension Bedrooms {
    var title: String {
        switch self {
        case .studio:
            "Studio"
        case .count(let count):
            count == 1 ? "1 Bed" : "\(count) Beds"
        }
    }
}
