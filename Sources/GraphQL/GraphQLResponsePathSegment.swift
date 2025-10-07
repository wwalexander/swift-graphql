public enum GraphQLResponsePathSegment {
    case name(String)
    case index(Int)
}

extension GraphQLResponsePathSegment: Sendable {}

extension GraphQLResponsePathSegment: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .name(value)
    }
}

extension GraphQLResponsePathSegment: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .index(value)
    }
}

extension GraphQLResponsePathSegment: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let name = try? container.decode(String.self) {
            self = .name(name)
        } else if let index = try? container.decode(Int.self) {
            self = .index(index)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "TODO")
        }
    }
}

extension GraphQLResponsePathSegment: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case let .name(name): try container.encode(name)
        case let .index(index): try container.encode(index)
        }
    }
}
