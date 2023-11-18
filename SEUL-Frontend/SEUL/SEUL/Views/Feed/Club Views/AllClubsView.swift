//
//  AllClubsView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/9/22.
//

import SwiftUI

struct AllClubsView: View {
    
    @State private var searchQuery = ""
    @EnvironmentObject  var allClubsVM: ClubListViewModel
    
    let alphabet = ["A","B","C","D"]
    
    var body: some View {
        List{
            if(searchQuery.isEmpty) {
                ForEach(alphabet, id: \.self) { letter in
                    Section(header: Text(letter)) {
                        ForEach(allClubsVM.clubList) { club in
                            if(club.clubName.hasPrefix(letter)){
                                NavigationLink(destination: ClubPageView(club: club).environmentObject(allClubsVM)) {
                                    Text(club.clubName)
                                }
                            }
                        }
                    }.id(letter)
                }
            } else {
                ForEach(allClubsVM.searchResults(query: searchQuery)) { club in
                    NavigationLink(destination: ClubPageView(club: club).environmentObject(allClubsVM)) {
                        Text(club.clubName)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Clubs")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct AllClubsView_Previews: PreviewProvider {
    static var previews: some View {
        AllClubsView()
    }
}
