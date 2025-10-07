// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-graphql",
    platforms: [
        .macOS(.v12)
    ],
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
        .target(
            name: "GraphQLHTTP",
            dependencies: ["GraphQL"]
        ),
        .testTarget(
            name: "GraphQLTests",
            dependencies: ["GraphQL"]
        ),
    ]
)
