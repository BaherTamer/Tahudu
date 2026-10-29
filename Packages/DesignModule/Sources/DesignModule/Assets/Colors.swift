//
//  Colors.swift
//  DesignModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

extension UIColor {
    // The accent color stays in the app's asset catalog for the "Global Accent Color Name" setting.
    public static let accentColor = UIColor(resource: .accent)
    public static let brand = UIColor(resource: .brand)

    // MARK: Social Media

    public static let whatsApp = UIColor(resource: .whatsApp)
}

extension Color {
    // Due to the "Global Accent Color Name" setting, AccentColor can already be found under Color.accentColor
    public static let accent = Color(.accent)
    public static let brand = Color(.brand)

    // MARK: Social Media

    public static let whatsApp = Color(.whatsApp)

    // MARK: Listings

    public static let success = Color(.success)
    public static let chipBackground = Color(.chipBackground)
    public static let chipText = Color(.chipText)
    public static let highlight = Color(.highlight)
}
