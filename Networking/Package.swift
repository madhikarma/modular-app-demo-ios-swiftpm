// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(name: "Alamofire",
//                 url: "https://github.com/Alamofire/Alamofire",
//                 from: Version(5, 4, 3)),
//        .package(name: "Realm",
//                 url: "https://github.com/realm/realm-cocoa",
//                 from: Version(10, 15, 1)),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Networking",
//            dependencies: ["Alamofire",
//                           "Realm",
//                           .product(name: "RealmSwift", package: "Realm")],
            dependencies: []
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        ),
    ]
)
