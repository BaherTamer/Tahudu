//
//  RoundedBorder.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

extension View {
    nonisolated func roundedBorder(
        radius: CGFloat,
        color: Color = Color(.separator),
        lineWidth: CGFloat = 1
    ) -> some View {
        self
            .clipShape(.rect(cornerRadius: radius))
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(
                        color,
                        lineWidth: lineWidth
                    )
            }
    }
}
