//
//  CountriesParseAndSave.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/12/24.
//

import Foundation

struct APIService {
    
    func getCountries() async -> [LeagueItem] {
        
        let endpoint = "https://v3.football.api-sports.io/leagues"
        
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            request.addValue("296ab11106d0937020da7faaafa279f4", forHTTPHeaderField: "x-apisports-key")
            
            do{
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(LeaguesResponse.self, from: data)
                
                return result.leagues ?? []
                
            } catch {
                print(error)
            }
        }
        
        return []
    }
}
