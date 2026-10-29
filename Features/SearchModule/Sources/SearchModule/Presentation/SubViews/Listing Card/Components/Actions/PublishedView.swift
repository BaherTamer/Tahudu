//
//  PublishedView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct PublishedView: View {
    // MARK: - Inputs
    let published: Date
    
    // MARK: - Body
    var body: some View {
        dateText
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Components
extension PublishedView {
    @ViewBuilder
    private var dateText: some View {
        if #available(iOS 18.0, *) {
            Text(published, format: .reference(to: .now))
        } else {
            Text(published, style: .relative)
        }
    }
}
