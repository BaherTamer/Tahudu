//
//  StateScreen.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct StateScreen: View {
    // MARK: - Inputs
    let systemImage: String
    let title: String
    let message: String
    var actionTitle: String?
    var action: (() -> Void)?
    
    // MARK: - Body
    var body: some View {
        VStack {
            iconImage
            titleText
            messageText
            actionButton
        }
        .multilineTextAlignment(.center)
        .padding()
        .padding(.top, 32)
    }
}

// MARK: - Components
extension StateScreen {
    private var iconImage: some View {
        Image(systemName: systemImage)
            .font(.largeTitle)
            .foregroundStyle(.secondary)
    }

    private var titleText: some View {
        Text(title)
            .font(.headline)
    }

    private var messageText: some View {
        Text(message)
            .font(.caption)
            .foregroundStyle(.secondary)
    }

    @ViewBuilder
    private var actionButton: some View {
        if let actionTitle, let action {
            Button(actionTitle, action: action)
                .font(.caption)
                .buttonStyle(.bordered)
                .padding(.top)
        }
    }
}
