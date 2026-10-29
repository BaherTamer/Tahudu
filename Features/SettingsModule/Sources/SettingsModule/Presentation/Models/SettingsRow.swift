//
//  SettingsRow.swift
//  SettingsModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import Foundation

enum SettingsRow {
    case language
    case country
    case notifications
    case about
    case feedback
}

// MARK: - Config Variables
extension SettingsRow {
    var title: String {
        switch self {
        case .language:
            "Language"
        case .country:
            "Country"
        case .notifications:
            "Notifications"
        case .about:
            "About"
        case .feedback:
            "Feedback"
        }
    }

    var systemImage: String {
        switch self {
        case .language:
            "textformat"
        case .country:
            "globe"
        case .notifications:
            "app.badge"
        case .about:
            "info.circle"
        case .feedback:
            "text.bubble"
        }
    }

    var detail: String? {
        switch self {
        case .language:
            Bundle.main.preferredLocalizations.first.flatMap(
                Locale.current.localizedString(forLanguageCode:)
            )
        case .country:
            "United Arab Emirates"
        case .notifications, .about, .feedback:
            nil
        }
    }

    var accessibilityIdentifier: String {
        switch self {
        case .language:
            "SettingsCell_language"
        case .country:
            "SettingsCell_country"
        case .notifications:
            "SettingsCell_notifications"
        case .about:
            "SettingsCell_about"
        case .feedback:
            "SettingsCell_feedback"
        }
    }
}
