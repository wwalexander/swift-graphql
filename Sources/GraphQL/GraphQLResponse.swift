public struct GraphQLResponse<Data> {
    public var data: Data?
    public var errors: GraphQLErrors?
    
    public var result: Result<Data, GraphQLErrors> {
        switch (data, errors) {
        case let (_, .some(errors)): .failure(errors)
        case (.none, .none): .failure([])
        case let (.some(data), .none): .success(data)
        }
    }
}

extension GraphQLResponse: Decodable where Data: Decodable {}
extension GraphQLResponse: Encodable where Data: Encodable {}
