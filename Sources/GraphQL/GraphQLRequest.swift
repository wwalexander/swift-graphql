public struct GraphQLRequest<Variables> {
    public var query: String
    public var operationName: String?
    public var variables: Variables?
    
    public init(
        query: String,
        operationName: String? = nil,
        variables: Variables?
    ) {
        self.query = query
        self.variables = variables
    }
    
    public init(
        query: String,
        operationName: String? = nil
    ) where Variables == GraphQLRequestVariablesNone {
        self.init(query: query, operationName: operationName, variables: nil)
    }
    
    public init(query: String, variables: Variables) {
        self.query = query
        self.variables = variables
    }
    
}

public struct GraphQLRequestVariablesNone: Codable {}

extension GraphQLRequest: Decodable where Variables: Decodable {}
extension GraphQLRequest: Encodable where Variables: Encodable {}
