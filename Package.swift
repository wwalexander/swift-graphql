// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-graphql",
    products: [
        .library(
            name: "GraphQL",
            targets: ["GraphQL"]
        ),
    ],
    targets: [
        .target(
            name: "GraphQL"
        ),
        .testTarget(
            name: "GraphQLTests",
            dependencies: ["GraphQL"]
        ),
    ]
)
