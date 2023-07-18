// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFIcons",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v8),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "SFIcons",
            targets: ["SFIcons"]
        ),
    ],
    targets: [
        .target(name: "SFIcons"),
    ]
)
