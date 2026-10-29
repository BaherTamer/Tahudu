//
//  DeliveryYearView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import DesignModule
import SwiftUI

struct DeliveryYearView: View {
    // MARK: - Inputs
    let year: Int

    // MARK: - Body
    var body: some View {
        Text("Delivery: \(year)")
            .font(.caption)
            .foregroundStyle(Color.chipText)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                Color.chipBackground,
                in: .rect(cornerRadius: 12)
            )
    }
}
