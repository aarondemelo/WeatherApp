//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Aaron demelo on 15/09/22.
//

import Foundation

public protocol Endpoint
{
    
    var path: String { get }
 
    var baseURL: String { get }
    
    var parameters: [URLQueryItem] { get }

    var method : String { get }
    
    var apiKey : String { get }
}

public enum NetworkError: Error
{
    case invalidURL
    case emptyAPIKey
    case serverResponseError(Int)
    case invalidData
}


public extension Endpoint
{
    
    func request<T: Codable>() async throws -> T
    {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path
        
        if parameters.count > 0
        {
            components.queryItems = parameters
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        
        let networkResponse: (Data, URLResponse)!
        
        if #available(iOS 15.0, *) {
            networkResponse = try await URLSession.shared.data(for: urlRequest)
        } else {
            networkResponse = try await URLSession.shared.data(from: urlRequest)
        }

        guard let response = networkResponse.1 as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300  else
        {
            if let statusCode = (networkResponse.1 as? HTTPURLResponse)?.statusCode
            {
                throw NetworkError.serverResponseError(statusCode)
            }
            else
            {
                throw NetworkError.serverResponseError(-1)
            }
        }
        
        guard let responseData = try? JSONDecoder().decode(T.self, from: networkResponse.0) else
        {
            throw NetworkError.invalidData
        }
        
        return responseData
    }
    
        
}

@available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
extension URLSession {
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
         try await withCheckedThrowingContinuation { continuation in
             let task = self.dataTask(with: request, completionHandler: { data, response, error in
                 guard let data = data, let response = response else {
                     let error = error ?? URLError(.badServerResponse)
                     return continuation.resume(throwing: error)
                 }

                 continuation.resume(returning: (data, response))
             })

             task.resume()
        }
    }
}
