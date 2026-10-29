//
//  SearchHeaderButton.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct SearchHeaderButton: View {
    // MARK: - Inputs
    let systemName: String
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(
            action: action,
            label: iconImage
        )
    }
}

// MARK: - Components
extension SearchHeaderButton {
    private func iconImage() -> some View {
        Image(systemName: systemName)
            .font(.title3)
            .frame(width: 44, height: 44)
    }
}
