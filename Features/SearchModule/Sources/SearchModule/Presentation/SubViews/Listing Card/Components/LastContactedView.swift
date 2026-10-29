//
//  LastContactedView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct LastContactedView: View {
    // MARK: - Inputs
    let date: Date
    
    // MARK: - Variables
    private var dateFormat: Date.FormatStyle {
        .dateTime.day().month(.abbreviated).year()
    }

    // MARK: - Body
    var body: some View {
        Label(
            "Last contacted: \(date, format: dateFormat)",
            systemImage: "phone.fill"
        )
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(Color.highlight)
    }
}
