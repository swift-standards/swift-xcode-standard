// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-xcode-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Xcode Workspace Standard", targets: ["Xcode Workspace Standard"]),
        .library(name: "Xcode Scheme Standard", targets: ["Xcode Scheme Standard"]),
    ],
    targets: [
        .target(name: "Xcode Standard"),
        .target(
            name: "Xcode Workspace Standard",
            dependencies: ["Xcode Standard"]
        ),
        .target(
            name: "Xcode Scheme Standard",
            dependencies: ["Xcode Standard"]
        ),
        .testTarget(
            name: "Xcode Workspace Standard Tests",
            dependencies: ["Xcode Workspace Standard"]
        ),
        .testTarget(
            name: "Xcode Scheme Standard Tests",
            dependencies: ["Xcode Scheme Standard"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableExperimentalFeature("LifetimeDependence"),
            .enableExperimentalFeature("Lifetimes"),
            .enableExperimentalFeature("SuppressedAssociatedTypes"),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("LifetimeDependence"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        ]
}
