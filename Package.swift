// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DynamicOverlay",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DynamicOverlay",
            targets: ["DynamicOverlay"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ondrejstasek/OverlayContainer.git", from: "3.5.2")
    ],
    targets: [
        .target(
            name: "DynamicOverlay",
            dependencies: ["OverlayContainer"],
            path: "Source",
            exclude:[
                "Info.plist"
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
