//
//  RMRequest.swift
//  RickAndMortyAPI
//
//  Created by Rahul Acharya on 2023-01-09.
//

import Foundation

/// Object  that represent a singlet API call
final class RMRequest {

    /*
     base url
     endpoint
     path component
     query parameter
     */

    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"

    }
    
    /// Desired Endpoint
    private let endPoint: RMEndpoint
    
    /// PathComponent for API, if any
    private let pathComponent: [String]
    
    /// Query arguments for API, if any
    private let queryParameter: [URLQueryItem]

    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue


        if !pathComponent.isEmpty {
            
            pathComponent.forEach({
                string += "/\($0)"
            })
        }


        if !queryParameter.isEmpty {
            string += "?"

            let argumentString = queryParameter.compactMap({
                guard let safeValue = $0.value else { return nil}
                return "\($0.name)=\(safeValue)"
            }).joined(separator: "&")
            string += argumentString
        }

        return string

    }
    
    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }

    public let httpMethod = "GET"

//    Mark: - Public
    
    /// Constructed Request
    /// - Parameters:
    ///   - endpoint: Target EndPoint
    ///   - pathComponent: Collection of paths Components
    ///   - queryParameter: Collection of Query Parameter
    public init(
        endpoint: RMEndpoint,
        pathComponent: [String] = [],
        queryParameter: [URLQueryItem] = []
    ){
        self.endPoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }

}


