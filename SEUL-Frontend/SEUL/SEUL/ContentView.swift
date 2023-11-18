//
//  ContentView.swift
//  SEUL
//
//  Created by Harpreet Multani on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .feed

    enum Tab {
        case roommatefinder
        case maps
        case feed
        case marketplace
        case profile
    }

    var body: some View {
        TabView(selection: $selection) {
            
            RoommateFinder()
                .tabItem {
                    Label("Roommates", systemImage: "person.2.fill")
                }
                .tag(Tab.roommatefinder)
            
            Maps()
                .tabItem {
                    Label("Maps", systemImage: "book")
                }
                .tag(Tab.maps)
            
            Feed()
                .tabItem {
                    Label("Feed", systemImage: "message")
                }
                .tag(Tab.feed)
            
            MarketPlace(text: .constant(""), items: MarketCollection().collection)
                .tabItem {
                    Label("MarketPlace", systemImage: "tag")
                }
                .tag(Tab.marketplace)

            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
