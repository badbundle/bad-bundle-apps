// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "BadBundleApps",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "BadBundleApps", targets: ["BadBundleApps"]),
    ],
    targets: [
        .target(
            name: "BadBundleApps",
            resources: [.process("Icons.xcassets")]
        ),
        .testTarget(
            name: "BadBundleAppsTests",
            dependencies: ["BadBundleApps"]
        ),
    ]
)
