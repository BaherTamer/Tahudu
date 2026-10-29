// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkModule",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "NetworkModule",
            targets: ["NetworkModule"]
        ),
    ],
    targets: [
        .target(
            name: "NetworkModule",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
