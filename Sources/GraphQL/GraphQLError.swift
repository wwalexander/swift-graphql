import Foundation

public struct GraphQLError {
    var message: String
    var locations: [GraphQLErrorLocation]?
    var path: GraphQLResponsePath?
}

extension GraphQLError: Codable {}

extension GraphQLError: LocalizedError {
    public var errorDescription: String? { message }
}
