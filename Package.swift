// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SCLogger",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],

    products: [
        .library(
            name: "SCLogger",
            targets: [
                "SCLogger"
            ])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SCLogger",
            dependencies: [],
            path: "Sources/SCLogger",
        .testTarget(
            name: "SCLoggerTests",
            dependencies: ["SCLogger"],
            path: "Tests/SCLoggerTests")
    ]
)

