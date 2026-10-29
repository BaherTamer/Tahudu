//
//  SearchError.swift
//  Tahudu
//
//  Created by Baher Tamer on 29/10/2026.
//

enum SearchError: Error {
    case noInternet
    case serviceUnavailable
}

extension SearchError {
    var message: String {
        switch self {
        case .noInternet:
            "No internet connection. Check your connection and try again."
        case .serviceUnavailable:
            "Listings aren't available right now. Please try again."
        }
    }
}
