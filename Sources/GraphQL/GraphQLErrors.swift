public struct GraphQLErrors: RawRepresentable {
    public var rawValue: [GraphQLError]
    
    public init(rawValue: [GraphQLError]) {
        self.rawValue = rawValue
    }
}

extension GraphQLErrors: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: GraphQLError...) {
        self.init(rawValue: elements)
    }
}

extension GraphQLErrors: Error {}

extension GraphQLErrors: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode([GraphQLError].self)
    }
}

extension GraphQLErrors: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
