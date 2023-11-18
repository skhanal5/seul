//
//  ModalView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var isShowing: Bool
    @Binding var filterText: String
    @Binding var filterIcon: String
    @State private var curHeight: CGFloat = 470
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    var mainView : some View {
        VStack {
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            
            ZStack {
                VStack(alignment: .center, spacing: 15){
                    Group {
                        HStack(){
                            Image(systemName: "flame")
                                .font(.system(size: 25))
                            Text("Trending")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading, 25)
                            .onTapGesture {
                                filterText = "Trending"
                                filterIcon = "flame"
                                isShowing = false
                            }
                        Divider()
                        HStack{
                            Image(systemName: "star")
                                .font(.system(size: 25))
                            Text("New")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading, 20)
                            .onTapGesture {
                                filterText = "New"
                                filterIcon = "star"
                                isShowing = false
                            }
                        Divider()
                        HStack{
                            Image(systemName: "questionmark.app")
                                .font(.system(size: 25))
                            Text("Question & Answer")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading, 20)
                            .onTapGesture {
                                filterText = "Question & Answer"
                                filterIcon = "questionmark.app"
                                isShowing = false
                            }
                        Divider()
                        HStack{
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 25))
                            Text("Poll")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading, 20)
                            .onTapGesture {
                                filterText = "Poll"
                                filterIcon = "line.3.horizontal"
                                isShowing = false
                            }
                        Divider()
                        HStack{
                            Image(systemName: "face.smiling")
                                .font(.system(size: 25))
                            Text("Funny")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Spacer()
                        }.padding(.leading, 20)
                            .onTapGesture {
                                filterText = "Funny"
                                filterIcon = "face.smiling"
                                isShowing = false
                            }
                        Divider()
                    }
                    HStack{
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 25))
                        Text("Timeline")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.leading, 10)
                        Spacer()
                    }.padding(.leading, 20)
                        .onTapGesture {
                            filterText = "Timeline"
                            filterIcon = "line.3.horizontal.decrease.circle"
                            isShowing = false
                        }
                    Divider()
                }
            }
            .padding(.bottom, 80)
            .frame(maxHeight: .infinity)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .shadow(radius: 10)
                Rectangle().frame(height: curHeight/2)
            }
            .foregroundColor(.white)
        }
    }
    
    
}
