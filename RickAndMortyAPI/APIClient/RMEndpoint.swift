//
//  RMEndpoint.swift
//  RickAndMortyAPI
//
//  Created by Rahul Acharya on 2023-01-09.
//

import Foundation

/// Represent unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character in info
    case character
    /// Endpoint to get character in info
    case location
    /// Endpoint to get character in info
    case episode
}
