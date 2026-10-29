//
//  SettingsView.swift
//  Tahudu
//

import SwiftUI

struct SettingsView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let settingsVC = SettingsViewController()
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.navigationBar.prefersLargeTitles = true
        return settingsNC
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Nothing here
    }
}
