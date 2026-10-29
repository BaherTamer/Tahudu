// 
//  SettingsViewController.swift
//  Tahudu
//

import UIKit

final class SettingsViewController: UITableViewController {
    // MARK: - Life Cycle
    
    init() {
        super.init(style: .insetGrouped)
        title = "My Account"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(
            SettingsCell.self,
            forCellReuseIdentifier: SettingsCell.identifier
        )
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        SettingsSection.allCases.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingsSection.allCases[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsCell.identifier,
            for: indexPath
        ) as? SettingsCell else {
            return UITableViewCell()
        }

        cell.configure(with: row(at: indexPath))
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        handleSelection(of: row(at: indexPath))
    }
}

// MARK: - Private Helpers
extension SettingsViewController {
    private func row(at indexPath: IndexPath) -> SettingsRow {
        SettingsSection.allCases[indexPath.section].rows[indexPath.row]
    }

    private func handleSelection(of row: SettingsRow) {
        switch row {
        case .language:
            openSystemSettings()
        case .country:
            showCountrySelectionScreen()
        case .notifications:
            showNotificationScreen()
        case .about:
            showAboutScreen()
        case .feedback:
            showFeedbackScreen()
        }
    }
}

// ===============================

/// NO NEED TO TUOCH THIS!!!
extension SettingsViewController {
    private func openSystemSettings() {
        print(#function)
    }

    private func showCountrySelectionScreen() {
        print(#function)
    }

    private func showNotificationScreen() {
        print(#function)
    }

    private func showAboutScreen() {
        print(#function)
    }

    private func showFeedbackScreen() {
        print(#function)
    }
}
