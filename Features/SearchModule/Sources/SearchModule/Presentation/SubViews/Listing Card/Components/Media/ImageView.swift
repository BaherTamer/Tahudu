//
//  ImageView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import DesignModule
import SwiftUI

struct ImageView: View {
    // MARK: - Inputs
    let image: String
    
    // MARK: - Body
    var body: some View {
        Image(image, bundle: .designModule)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}
