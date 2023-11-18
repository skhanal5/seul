//
//  SwiftUIView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/16/22.
//

import SwiftUI

struct ContactView: View {
    @Environment(\.presentationMode) var mode
    @StateObject var viewModel = UserListViewModel()
    @State var searchQuery = ""
    @State private var sentMessage = false
    @EnvironmentObject var chatVM: ChatsViewModel
    
    let alphabet = ["A","B","C","D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O","P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var body: some View {
        List{
            if(searchQuery.isEmpty) {
                ForEach(alphabet, id: \.self) { letter in
                    Section(header: Text(letter)) {
                        ForEach(viewModel.userList) { person in
                            if (person.name.hasPrefix(letter)) {
                                NavigationLink(destination: NewMessageView(receiver: person, sent: $sentMessage).environmentObject(chatVM)) {
                                    Text(person.name + " - " + person.major)
                                }
                            }
                        }
                    }.id(letter)
                }
            } else {
                ForEach(viewModel.searchResults(query: searchQuery)) { person in
                    NavigationLink(destination: NewMessageView(receiver: person, sent: $sentMessage).environmentObject(chatVM)) {
                        Text(person.name + " - " + person.major)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: sentMessage, perform: { value in
            if (value == true){
                self.mode.wrappedValue.dismiss()
            }
        })
    }
}
