//
//  TeamListView.swift
//  FootballSense
//
//  Created by Kenny Albert on 2/14/24.
//

import SwiftUI
import Kingfisher

struct TeamListView: View {
    @State private var teams: [TeamItem] = []
    let service = APITeam()
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                if teams.isEmpty {
                    Text("Loading teams...")
                } else {
                    ForEach(teams, id: \.team?.id) { team in
                        VStack {
                            KFImage(URL(string: team.team?.logo ?? ""))
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(team.team?.name ?? "")
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
                teams = await service.getTeams(leagueID: "39")
            }
        }
    }
}


#Preview {
    TeamListView()
}
