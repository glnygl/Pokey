//
//  MockNetworkManager.swift
//  PokeyUnitTests
//
//  Created by Glny Gl on 22/09/2024.
//

import XCTest
@testable import Pokey

final class MockNetworkManager: NetworkServiceProtocol, Mockable {
    
    var shouldThrowError = false
    
    func performRequest<T>(type: T.Type, with request: BaseRequest) async throws -> T where T : Decodable, T : Encodable {
        if shouldThrowError {
            throw NSError(domain: "performRequest", code: 0, userInfo: nil)
        }
        if request is DiscoverRequest {
            let data = loadJson(fileName: "DiscoverMockData", type:  PokeyList.self) as! T
            return data
        } else {
            throw NSError(domain: "performRequest", code: 0, userInfo: nil)
        }
    }
}
