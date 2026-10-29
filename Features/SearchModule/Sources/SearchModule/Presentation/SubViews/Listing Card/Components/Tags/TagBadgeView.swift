//
//  TagBadgeView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import DesignModule
import SwiftUI

struct TagBadgeView: View {
    // MARK: - Inputs
    let tag: ListingTag

    // MARK: - Body
    var body: some View {
        Text(tag.title)
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                tag.backgroundColor,
                in: .rect(cornerRadius: 4)
            )
    }
}
