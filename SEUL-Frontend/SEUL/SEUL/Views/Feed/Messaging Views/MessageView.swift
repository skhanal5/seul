//
//  MessageView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

struct MessageView: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""
    
    var body: some View {
        List {
            ForEach(viewModel.getSortedFilteredChat(query: query)) { chat in
                ZStack {
                    ChatCellView(chat: chat)
                    NavigationLink(destination: {
                        ChatView(chat: chat)
                            .environmentObject(viewModel)
                    }) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 0)
                    .opacity(0)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Messages")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink(destination: ContactView().environmentObject(viewModel)) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
