//
//  Movie.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation

public struct Movie: Codable {
    public let title: String
    public let episodeID: Int
    public let openingCrawl, director, producer, releaseDate: String
    public let characters, planets, starships, vehicles: [String]
    public let species: [String]
    public let created, edited: String
    public let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
    }
}
