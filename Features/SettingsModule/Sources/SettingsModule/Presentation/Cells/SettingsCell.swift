//
//  SettingsCell.swift
//  SettingsModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import UIKit

final class SettingsCell: UITableViewCell {
    static let identifier = "SettingsCell"

    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration
extension SettingsCell {
    func configure(with row: SettingsRow) {
        var content: UIListContentConfiguration = row.detail == nil ? .cell() : .valueCell()
        content.text = row.title
        content.secondaryText = row.detail
        content.image = UIImage(systemName: row.systemImage)
        contentConfiguration = content
        accessibilityIdentifier = row.accessibilityIdentifier
    }
}

// MARK: - Private Helpers
extension SettingsCell {
    private func setupCell() {
        backgroundColor = .systemBackground
        accessoryType = .disclosureIndicator
    }
}
