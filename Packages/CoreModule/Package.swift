// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreModule",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "CoreModule",
            targets: ["CoreModule"]
        ),
    ],
    targets: [
        .target(
            name: "CoreModule",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
