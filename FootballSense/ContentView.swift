//
//  ContentView.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/12/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var leagues: [LeagueItem] = []
    let service = APIService()
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                if leagues.isEmpty {
                    Text("Loading leagues...")
                } else {
                    ForEach(leagues, id: \.league?.id) { league in
                        VStack {
                            KFImage(URL(string: league.league?.logo ?? ""))
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(league.league?.name ?? "")
                                .font(.caption)
                        }
                        .padding(.top)
                        .padding(.bottom)
                        .onTapGesture {
                            //detail
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            Task {
                leagues = await service.getCountries()
            }
        }
    }
}


#Preview {
    ContentView()
}
