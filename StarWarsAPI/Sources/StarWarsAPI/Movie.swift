//
//  Movie.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation

public struct Movie {
    public let title: String
    public let episodeID: Int
    public let openingCrawl, director, producer, releaseDate: String
    public let characters, planets, starships, vehicles: [String]
    public let species: [String]
    public let created, edited: String
    public let url: String

    public init(title: String, episodeID: Int, openingCrawl: String, director: String, producer: String, releaseDate: String, characters: [String], planets: [String], starships: [String], vehicles: [String], species: [String], created: String, edited: String, url: String) {
        self.title = title
        self.episodeID = episodeID
        self.openingCrawl = openingCrawl
        self.director = director
        self.producer = producer
        self.releaseDate = releaseDate
        self.characters = characters
        self.planets = planets
        self.starships = starships
        self.vehicles = vehicles
        self.species = species
        self.created = created
        self.edited = edited
        self.url = url
    }
}

extension Movie: Codable {
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

extension Movie: Identifiable {
    public var id: Int {
        return episodeID
    }
}
