public struct GraphQLErrorLocation {
    public var line: Int
    public var column: Int
}

extension GraphQLErrorLocation: Sendable {}
extension GraphQLErrorLocation: Codable {}
