// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SettingsModule",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "SettingsModule",
            targets: ["SettingsModule"]
        ),
    ],
    targets: [
        .target(
            name: "SettingsModule",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
