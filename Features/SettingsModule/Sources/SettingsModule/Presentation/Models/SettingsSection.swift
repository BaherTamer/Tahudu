//
//  SettingsSection.swift
//  SettingsModule
//
//  Created by Baher Tamer on 29/10/2026.
//

enum SettingsSection: CaseIterable {
    case general
    case support
}

extension SettingsSection {
    var rows: [SettingsRow] {
        switch self {
        case .general:
            [.language, .country, .notifications]
        case .support:
            [.about, .feedback]
        }
    }
}
