//
//  TagsView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct TagsView: View {
    // MARK: - Inputs
    let tags: [ListingTag]

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(
                tags,
                id: \.self,
                content: TagBadgeView.init
            )
        }
    }
}
