import GraphQL
import Foundation

public struct GraphQLHTTPClient {
    public let endpoint: URL
    let headers: [String: String?]
    let urlSession: URLSession
    let jsonDecoder: JSONDecoder
    let jsonEncoder: JSONEncoder
    
    public init(
        endpoint: URL,
        headers: [String: String?] = [:],
        urlSession: URLSession = .shared
    ) {
        self.endpoint = endpoint
        self.headers = headers
        self.urlSession = urlSession
        self.jsonDecoder = .init()
        self.jsonEncoder = .init()
    }
    
    public func data<Variables: Encodable, Data: Decodable>(_ type: Data.Type, for request: GraphQLRequest<Variables>) async throws -> Data {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/graphql-response+json, application/json", forHTTPHeaderField: "Accept")
        
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        urlRequest.httpBody = try jsonEncoder.encode(request)
        let (data, _) = try await urlSession.data(for: urlRequest)
        return try jsonDecoder.decode(GraphQLResponse<Data>.self, from: data).result.get()
    }
}
