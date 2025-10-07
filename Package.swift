// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-graphql",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GraphQL",
            targets: ["GraphQL"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "GraphQL"
        ),
        .testTarget(
            name: "GraphQLTests",
            dependencies: ["GraphQL"]
        ),
    ]
)
