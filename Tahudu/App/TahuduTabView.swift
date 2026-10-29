//
//  TahuduTabView.swift
//  Tahudu
//

import SearchModule
import SettingsModule
import SwiftUI

struct TahuduTabView: View {
    @State private var selectedTab = Tabs.search.rawValue

    var body: some View {
        TabView(selection: $selectedTab) {
            SearchFactory.makeScreen()
                .tint(Color.accent)
                .tag(Tabs.search.rawValue)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            SettingsFactory.makeScreen()
                .tint(Color.accent)
                .tag(Tabs.settings.rawValue)
                .tabItem {
                    Label("My Account", systemImage: selectedTab == Tabs.settings.rawValue ? "person.fill" : "person")
                }
                .edgesIgnoringSafeArea(.all)
        }
        .tint(Color.brand)
    }
}

enum Tabs: Int, CaseIterable {
    case search = 0
    case settings

    var name: String {
        switch self {
        case .search:
            return "Search"
        case .settings:
            return "Settings"
        }
    }
}
