// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QwirkleKit",
    platforms: [
        .macOS("13.1"),
        .iOS("16.1"),
    ],
    products: [
        .library(
            name: "QwirkleKit",
            targets: ["QwirkleKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "QwirkleKit",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            path: "Sources"),
        .testTarget(
            name: "QwirkleKitTests",
            dependencies: [
                "QwirkleKit",
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            path: "Tests"),
    ]
)
