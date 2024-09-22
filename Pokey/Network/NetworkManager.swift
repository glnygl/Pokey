//
//  NetworkManager.swift
//  Pokey
//
//  Created by Glny Gl on 23/07/2024.
//

import Foundation

enum CustomError: Error {
    case requestFailed
    case jsonConversionFailure(description: String)
    case responseUnsuccessful(description: String)
    case invalidURL(url: String)
    case parameterEncodingFailed
    case deleteFailed
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestPath: String {
    case discover = "/Biuni/PokemonGO-Pokedex/master/pokedex.json"
}

protocol BaseRequest {

    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    
    var queryParams: Codable? { get }
    var bodyParams: Codable? { get }
    
    func asURLRequest() throws -> URLRequest
}

extension BaseRequest {
    var headers: [String : String] { [:] }
    var bodyParams: Codable? { nil }
    var queryParams: Codable? { nil }
}

extension BaseRequest {
    
    var url: String {
        "https://raw.githubusercontent.com"
    }
    
    func asURLRequest() throws -> URLRequest {
        var query = ""
        if let queryParams = queryParams {
            query = try queryParams.dictionary().queryString()
        }
        let endpoint = url  + path + query
        
        guard let url = URL(string: endpoint)
        else {
            throw CustomError.invalidURL(url: endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue

        if let bodyParams = bodyParams {
            do {
                let body = try JSONEncoder().encode(bodyParams)
                urlRequest.httpBody = body
            } catch {
                throw CustomError.parameterEncodingFailed
            }
        }
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

protocol NetworkServiceProtocol {
    var session: URLSession { get }
    func performRequest<T: Codable>(
          type: T.Type,
          with request: BaseRequest) async throws -> T
}

extension NetworkServiceProtocol {
    var session: URLSession {
        URLSession.shared
    }
}


class NetworkManager: NetworkServiceProtocol {
    
    func performRequest<T>(type: T.Type, with request: BaseRequest) async throws -> T where T : Decodable {
        let req = try request.asURLRequest()
        let (data, response) = try await session.data(for: req)
         guard let httpResponse = response as? HTTPURLResponse else {
             throw CustomError.requestFailed
         }
         guard httpResponse.statusCode == 200 else {
             throw CustomError.responseUnsuccessful(description: "status code \(httpResponse.statusCode)")
         }
         do {
             let decoder = JSONDecoder()
             let result = try decoder.decode(type, from: data)
             return result
         } catch {
             throw CustomError.jsonConversionFailure(description: error.localizedDescription)
         }
    }
}
