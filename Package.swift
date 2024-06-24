// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MusicDownloadButton",
    platforms: [
        .iOS(
            .v14
        )
    ],
    products: [
        .library(
            name: "MusicDownloadButton",
            targets: ["MusicDownloadButton"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MusicDownloadButton",
            dependencies: [],
            path: "./MusicDownloadButton-iOS"
        )
    ]
)
