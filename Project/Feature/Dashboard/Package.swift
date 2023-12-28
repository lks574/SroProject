// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dashboard",
    platforms: [
      .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Dashboard",
            targets: ["Dashboard"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/interactord/LinkNavigator",
        .upToNextMajor(from: "1.0.2")),
      .package(
        url: "https://github.com/pointfreeco/swift-composable-architecture",
        .upToNextMajor(from: "1.5.6")),
      .package(path: "../../Core/Architecture"),
      .package(path: "../../Core/Domain"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Dashboard",
            dependencies: [
              "LinkNavigator",
              .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
              "Architecture",
              "Domain",
            ]
        ),
        .testTarget(
            name: "DashboardTests",
            dependencies: ["Dashboard"]),
    ]
)
