//
//  BedroomsView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct BedroomsView: View {
    // MARK: - Inputs
    let bedrooms: Bedrooms
    
    // MARK: - Body
    var body: some View {
        Label(
            bedrooms.title,
            systemImage: "bed.double"
        )
        .font(.caption)
    }
}
