//
//  RMEpisode.swift
//  RickAndMortyAPI
//
//  Created by Rahul Acharya on 2023-01-09.
//

import Foundation

struct RMEpisode: Codable {
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
