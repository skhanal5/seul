//
//  ClubView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

struct ClubSideMenuView: View {
    
    //Binding variable that lets us manipulate the size of sidebar
    @Binding var size : CGFloat
    
    // This checks if the disclosure group is expanded
    @State private var isExpanded = false
    
    @StateObject var clubListVM = ClubListViewModel()
    
    //Defines the content in the sidebar -> the filter in this case
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text("Groups")
                    .font(.system(size: 15))
                    .bold()
                    .padding(.trailing, 10)
                Spacer()
                NavigationLink(destination: AllClubsView().environmentObject(clubListVM)){
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 15))
                }
                .padding(.trailing, 10)
            }.padding(.top, 20)
             .padding(.leading, 10)
            List {
                ForEach(clubListVM.userClubs) { club in
                    ClubCell(club: club)
                }
            }
            .listStyle(PlainListStyle())
            Spacer()
        }.frame(width: UIScreen.main.bounds.width / 1.8)
            .frame(maxHeight: .infinity)
            .background(Color.white)
        
    }
}

struct ClubCell: View {
    let club: ClubModel
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            AsyncImage(url: URL(string: club.clubProfilePic)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .clipped()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .clipped()
                case .failure:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .clipped()
                @unknown default:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .clipped()
                }
            }
            Text(club.clubName)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 40)
                .font(.system(size: 12))
        }
        .frame(height: 80)
        .padding(.leading, 10)
    }
    
}
