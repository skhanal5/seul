//
//  ClubPageView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/9/22.
//

import SwiftUI

struct ClubPageView: View {
    
    let club: ClubModel
    
    @EnvironmentObject var viewModel: ClubListViewModel
    
    @Environment(\.presentationMode) var mode
    
    @State private var clubAdded = false
    
    @State private var requestSent = false
    
    var body: some View {
        ScrollView {
            ZStack {
                AsyncImage(url: URL(string: club.clubBanner)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                            .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                            .cornerRadius(0)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                            .background(Color(red: 100/255, green: 100/255, blue: 100/255))
                            .cornerRadius(0)
                    case .failure:
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                            .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                            .cornerRadius(0)
                    @unknown default:
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                            .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                            .cornerRadius(0)
                    }
                }.ignoresSafeArea(.all)
            }
            HStack {
                AsyncImage(url: URL(string: club.clubProfilePic)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(.leading, 0)
                    case .failure:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    @unknown default:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    }
                }
                VStack(alignment: .leading){
                    HStack {
                        Text(club.clubName)
                            .font(.system(size: 18)).bold()
                        Button(action: {
                            viewModel.addClubToList(club: club)
                            clubAdded = true
                        }) {
                            Image(systemName: "plus.app.fill")
                                .padding(.leading, 20)
                                .font(.system(size: 20))
                        }.foregroundColor(clubAdded ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    }
                    Text(club.clubDescription)
                        .font(.system(size: 14))
                        .frame(width: UIScreen.main.bounds.width-159)
                        .lineLimit(6)
                }
                .padding(.leading, 10)
            }
            Divider()
                .padding(.top, 10)
            HStack {
                Text("Events")
                    .font(.system(size: 18))
                    .bold()
                    .padding(.leading, 25)
                Spacer()
                Button(action: {
                    requestSent = true
                }) {
                    Text(requestSent ? "Request Sent" : "Join Request")
                        .foregroundColor(requestSent ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background() {
                            Capsule()
                                .fill(requestSent ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                        }
                }
                .disabled(requestSent ? true : false)
                .padding(.trailing, 25)
            }
            .padding(.top, 10)
            
            //Simulating us generating the number of events
            
            VStack(spacing: 20) {
                VStack {
                    Image(systemName: "photo")
                        .font(.system(size: 200))
                        .padding(.bottom, 30)
                        .padding(.top, 10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                        .font(.system(size: 14))
                        .padding(.top, 10)
                        .padding(10)
                }
                .padding(.top, 50)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "photo")
                        .font(.system(size: 200))
                        .padding(.bottom, 30)
                        .padding(.top, 10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                        .font(.system(size: 14))
                        .padding(.top, 10)
                        .padding(10)
                }
                .padding(.top, 50)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "photo")
                        .font(.system(size: 200))
                        .padding(.bottom, 30)
                        .padding(.top, 10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                        .font(.system(size: 14))
                        .padding(.top, 10)
                        .padding(10)
                }
                .padding(.top, 50)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                .cornerRadius(10)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }) {
            HStack {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 10))
                }
                .padding(10)
                .background(.white)
                .shadow(radius: 12)
                .cornerRadius(12)
                Spacer()
            }
        })
        .ignoresSafeArea(edges: .top)
    }
}
