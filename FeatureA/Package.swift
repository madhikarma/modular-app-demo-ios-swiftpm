// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureA",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FeatureA",
            targets: ["FeatureA"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../SharedA"),
        .package(name: "FBSnapshotTestCase",
                 url: "https://github.com/uber/ios-snapshot-test-case",
                 from: Version(7, 0, 0)),
        .package(name: "EasyPeasy",
                 url: "https://github.com/nakiostudio/EasyPeasy",
                 from: Version(1, 10, 0)),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FeatureA",
            dependencies: ["SharedA", "EasyPeasy"]
        ),
        .testTarget(
            name: "FeatureATests",
            dependencies: ["FeatureA", "FBSnapshotTestCase"]
        ),
    ]
)
