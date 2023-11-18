//
//  Feed.swift
//  SEUL
//
//  Created by Harpreet Multani on 12/28/21.
//

import SwiftUI

/* Defines the main Feed screen
 
 Note: There is a lot of Bindable booleans that have yet to disable certain parts of the UI
 when 'true' (i.e., sidebar expanded -> user selects different tab). If left alone, causes a lot of
 visual bugs later. Most have been accounted for.
 
 */
struct Feed: View {
    @State private var searchQuery = ""
    
    @State private var disclosureText = "Timeline"
    
    @State private var showModal = false
    
    @State private var isExpanded = false
    
    @State private var filterText = "Timeline"
    
    @State private var filterIcon = "line.3.horizontal.decrease.circle"
    
    @State private var size = UIScreen.main.bounds.width / 1.6
    
    @StateObject var feedListVM = FeedListViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView(){
                VStack(spacing: 0){
                    HStack{
                        Button(action: {
                            self.size = 10
                            isExpanded = true
                            showModal = false
                        }) {
                            Image(systemName: "person.3.fill")
                                .foregroundColor(Color.black)
                        }
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .padding(.leading, 10.0)
                            TextField("Search", text: $searchQuery)
                                .frame(height:30)
                        }.background(Color(red: 242/255, green: 243/255, blue: 245/255))
                            .cornerRadius(8)
                        NavigationLink(destination: NewPostView().environmentObject(feedListVM)) {
                            Image(systemName: "note.text.badge.plus")
                                .padding(.trailing, 10.0)
                                .foregroundColor(Color.black)
                        }
                        NavigationLink(destination: MessageView()) {
                            Image(systemName: "paperplane.circle")
                                .foregroundColor(Color.black)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 17)
                    .background(Color.white)
                    .disabled(isExpanded ? true: false)
                    .onTapGesture{
                        showModal = false
                        isExpanded = false
                        size = UIScreen.main.bounds.width / 1.6
                    }
                    Divider()
                    VStack {
                        HStack {
                            Button(action: {
                                showModal = true
                            }, label: {
                                HStack() {
                                    Image(systemName: filterIcon)
                                    Text(filterText)
                                        .font(.headline)
                                    Image(systemName: "chevron.down")
                                }
                            })
                                .padding()
                                .padding(.top, 5)
                            Spacer()
                        }
                        
                        ScrollView{
                            ForEach(feedListVM.feed) { post in
                                VStack(){
                                    FeedCell(post: post)
                                }.padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                Spacer()
                                Spacer()
                            }
                        }
                        .disabled(showModal ? true : false)
                        .disabled(isExpanded ? true: false)
                    }
                    .onTapGesture{
                        isExpanded = false
                        size = UIScreen.main.bounds.width / 1.6
                        showModal = false
                    }
                    .overlay{
                        HStack {
                            ClubSideMenuView(size: $size)
                                .padding(.leading, -size)
                                .offset(x: -size)
                            Spacer()
                        }.animation(.spring(), value: size)
                    }
                    Divider()
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .background(Color(red: 242/255, green: 243/255, blue: 245/255))
                .onTapGesture {
                    showModal = false
                }.overlay {
                    FilterView(isShowing: $showModal, filterText: $filterText, filterIcon: $filterIcon)
                }
            }
            .accentColor(.black)
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
