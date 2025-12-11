public struct GraphQLError {
    var message: String
    var locations: [GraphQLErrorLocation]?
    var path: GraphQLResponsePath?
}

extension GraphQLError: Codable {}

extension GraphQLError: Error {
    public var localizedDescription: String { message }
}
