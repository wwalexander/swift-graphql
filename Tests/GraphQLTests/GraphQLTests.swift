import Testing
@testable import GraphQL
import Foundation

@Suite struct ResponseTests {
    @Suite struct ErrorTests {
        @Test func testResponseError() throws {
            struct Data: Decodable {
                var hero: Hero
                
                struct Hero: Decodable {
                    var name: String
                    var heroFriends: [Friend]
                    
                    struct Friend: Decodable {
                        var id: String
                        var name: String?
                    }
                }
            }
            
            let response = try JSONDecoder().decode(GraphQLResponse<Data>.self, from: .init("""
                {
                  "errors": [
                    {
                      "message": "Name for character with ID 1002 could not be fetched.",
                      "locations": [{ "line": 6, "column": 7 }],
                      "path": ["hero", "heroFriends", 1, "name"]
                    }
                  ],
                  "data": {
                    "hero": {
                      "name": "R2-D2",
                      "heroFriends": [
                        {
                          "id": "1000",
                          "name": "Luke Skywalker"
                        },
                        {
                          "id": "1002",
                          "name": null
                        },
                        {
                          "id": "1003",
                          "name": "Leia Organa"
                        }
                      ]
                    }
                  }
                }
            """.utf8))
            
            #expect(throws: GraphQLErrors.self) {
                try response.result.get()
            }
        }
    }
}
