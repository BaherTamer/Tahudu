//
//  PriceView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct PriceView: View {
    // MARK: - Inputs
    let price: Int
    let currency: String
    
    // MARK: - Body
    var body: some View {
        Text(
            price,
            format: .currency(code: currency)
        )
        .font(.headline)
    }
}
