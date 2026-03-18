// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IndyCWrapper",
    platforms: [
           .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IndyCWrapper",
            targets: ["IndyCWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/decentralised-dataexchange/LibIndy", from: "2026.3.1"),
        .package(url: "https://github.com/decentralised-dataexchange/libzmq", from: "2026.3.1"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMinor(from: "1.1.2300")),
    ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IndyCWrapper",
            dependencies: [
                "LibIndy",
                .product(name: "OpenSSL", package: "OpenSSL"),
                .product(name: "libzmq", package: "libzmq"),
            ],
            path: "Sources/IndyCWrapper",
            publicHeadersPath: "Indy"
        ),
        .testTarget(
            name: "IndyCWrapperTests",
            dependencies: ["IndyCWrapper"]
        ),
    ]
)
