//
//  ContactsView.swift
//  SearchModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

struct ContactsView<ViewModel: SearchViewModel>: View {
    // MARK: - Inputs
    let listingId: String
    let contactOptions: [ContactType]
    
    // MARK: - Environments
    @EnvironmentObject private var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(
                contactOptions,
                id: \.self,
                content: contactButton
            )
        }
    }
}

// MARK: - Components
extension ContactsView {
    private func contactButton(_ type: ContactType) -> some View {
        ContactButton(type) {
            viewModel.didTapContact(type, id: listingId)
        }
    }
}
