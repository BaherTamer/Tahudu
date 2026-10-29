//
//  TypeView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct TypeView: View {
    // MARK: - Inputs
    let type: String
    
    // MARK: - Body
    var body: some View {
        Text(verbatim: type)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
