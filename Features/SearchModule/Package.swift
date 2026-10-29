// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SearchModule",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "SearchModule",
            targets: ["SearchModule"]
        ),
    ],
    dependencies: [
        .package(path: "../CoreModule"),
        .package(path: "../DesignModule"),
        .package(path: "../NetworkModule"),
    ],
    targets: [
        .target(
            name: "SearchModule",
            dependencies: [
                "CoreModule",
                "DesignModule",
                "NetworkModule",
            ],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
