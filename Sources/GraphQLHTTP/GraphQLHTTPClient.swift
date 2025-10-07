import GraphQL
import Foundation

public struct GraphQLHTTPClient {
    public let endpoint: URL
    public let urlSession: URLSession
    let jsonDecoder: JSONDecoder
    let jsonEncoder: JSONEncoder
    
    public init(
        endpoint: URL,
        urlSession: URLSession = .shared
    ) {
        self.endpoint = endpoint
        self.urlSession = urlSession
        self.jsonDecoder = .init()
        self.jsonEncoder = .init()
    }
    
    public func data<Variables: Encodable, Data: Decodable>(for request: GraphQLRequest<Variables>) async throws -> Data {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/graphql-response+json, application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try jsonEncoder.encode(request)
        let (data, _) = try await urlSession.data(for: urlRequest)
        return try jsonDecoder.decode(GraphQLResponse<Data>.self, from: data).result.get()
    }
}
