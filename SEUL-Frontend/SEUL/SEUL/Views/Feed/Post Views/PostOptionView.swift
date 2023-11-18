//
//  PostModalView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/11/22.
//

import SwiftUI

struct PostOptionView: View {
    
    @Binding var isShowing: Bool
    
    @Binding var isPhotoActive: Bool
    
    @Binding var isLocationActive: Bool
    
    @Binding var isPollActive: Bool
    
    @Binding var isQnAActive: Bool
    
    @Binding var isTextActive: Bool
    
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
                VStack(alignment: .leading, spacing: 15){
                    Group {
                        HStack(){
                            Text("What do you want to post about?")
                                .font(.system(size: 20))
                                .bold()
                        }
                        .padding(.leading, 30)
                        Divider()
                        HStack{
                            Image(systemName: "photo.on.rectangle")
                                .font(.system(size: 25))
                            Text("Add Photo")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                        }
                        .onTapGesture {
                            isPhotoActive = true
                            isLocationActive = false
                            isPollActive = false
                            isQnAActive = false
                            isTextActive = false
                            isShowing = false
                        }
                        .padding(.leading, 30)
                        Divider()
                        HStack{
                            Image(systemName: "location.square")
                                .font(.system(size: 25))
                            Text("Add Location")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                        }
                        .padding(.leading, 30)
                        .onTapGesture {
                            isPhotoActive = false
                            isLocationActive = true
                            isPollActive = false
                            isQnAActive = false
                            isTextActive = false
                            isShowing = false
                        }
                        Divider()
                        HStack{
                            Image(systemName: "text.aligncenter")
                                    .font(.system(size: 25))
                            Text("Make a Poll")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                        }
                        .padding(.leading, 30)
                        .onTapGesture {
                            isPhotoActive = false
                            isLocationActive = false
                            isPollActive = true
                            isQnAActive = false
                            isTextActive = false
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
                        }
                        .padding(.leading, 30)
                        .onTapGesture {
                            isPhotoActive = false
                            isLocationActive = false
                            isPollActive = false
                            isQnAActive = true
                            isTextActive = false
                            isShowing = false
                        }
                        Divider()
                    }
                }
            }
            .padding(.bottom, 80)
            .frame(maxWidth: .infinity)
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
