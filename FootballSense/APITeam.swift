//
//  APITeam.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/14/24.
//

import Foundation

struct APITeam {
    
    func getTeams(leagueID: String?) async -> [TeamItem] {
        
        var endpointURL = "https://v3.football.api-sports.io/teams?&season=2022"
        
        if let leagueID = leagueID {
            endpointURL.append("&league=\(leagueID)")
        }
        
        if let url = URL(string: endpointURL) {
            var request = URLRequest(url: url)
            request.addValue("296ab11106d0937020da7faaafa279f4", forHTTPHeaderField: "x-apisports-key")
            
            do{
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(TeamsResponse.self, from: data)
                
                return result.teams ?? []
                
            } catch {
                print(error)
            }
        }
        
        return []
    }
}
