//
//  TeamsModel.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/14/24.
//

import Foundation

// MARK: - TeamsResponse
struct TeamsResponse: Codable {
    let teamsResponseGet: String?
    let teams: [TeamItem]?

    enum CodingKeys: String, CodingKey {
        case teamsResponseGet = "get"
        case teams = "response"
    }
}

// MARK: - Response
struct TeamItem: Codable {
    let team: Team?
    let venue: Venue?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, code, country: String?
    let founded: Int?
    let national: Bool?
    let logo: String?
}

// MARK: - Venue
struct Venue: Codable {
    let id: Int?
    let name, address, city: String?
    let capacity: Int?
    let surface: String?
    let image: String?
}
