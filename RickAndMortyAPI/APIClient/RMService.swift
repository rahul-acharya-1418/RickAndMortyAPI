//
//  RMService.swift
//  RickAndMortyAPI
//
//  Created by Rahul Acharya on 2023-01-09.
//

import Foundation


/// Primary API Service Object to get Rick and Morty Data
final class RMService {
    
    /// Shared sigletone instant
    static let shared = RMService()
    
    
    /// Privatised constructor
    private init() { }
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
        
    }
    
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            
            URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                // Decode response
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }

            }.resume()
            
            
            
    }
     
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
        
    }
}
