public struct GraphQLRequest<Variables> {
    public var query: String
    public var variables: Variables?
    
    init(query: String, variables: Variables?) {
        self.query = query
        self.variables = variables
    }
    
    public init(query: String) where Variables == GraphQLRequestVariablesNone {
        self.query = query
    }
    
    public init(query: String, variables: Variables) {
        self.query = query
        self.variables = variables
    }
    
}

public struct GraphQLRequestVariablesNone: Codable {}

extension GraphQLRequest: Decodable where Variables: Decodable {}
extension GraphQLRequest: Encodable where Variables: Encodable {}
