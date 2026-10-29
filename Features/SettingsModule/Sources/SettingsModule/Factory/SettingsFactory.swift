//
//  SettingsFactory.swift
//  SettingsModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

@MainActor
public enum SettingsFactory {
    public static func makeScreen() -> some View {
        SettingsView()
    }
}
