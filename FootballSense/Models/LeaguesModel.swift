//
//  LeaguesModel.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/14/24.
//

import Foundation


// MARK: - LeaguesResponse
struct LeaguesResponse: Codable {
    let leaguesResponseGet: String?
    let leagues: [LeagueItem]?

    enum CodingKeys: String, CodingKey {
        case leaguesResponseGet = "get"
        case leagues = "response"
    }
}

// MARK: - LeagueItem
struct LeagueItem: Codable {
    let league: League?
    let country: Country?
}

// MARK: - Country
struct Country: Codable {
    let name, code: String?
    let flag: String?
}

// MARK: - League
struct League: Codable {
    let id: Int?
    let name, type: String?
    let logo: String?
}
