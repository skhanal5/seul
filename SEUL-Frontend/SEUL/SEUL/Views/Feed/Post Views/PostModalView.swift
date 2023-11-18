//
//  PostModalView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/11/22.
//

import SwiftUI

struct PostModalView: View {
    
    @Binding var isShowing: Bool
    @Binding var dropDownText: String
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
                            Text("Choose who you want to see your post.")
                                .font(.system(size: 20))
                                .bold()
                        }
                        .padding(.leading, 5)
                        Divider()
                        HStack{
                            Text("Anyone")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Image(systemName: "network")
                                .font(.system(size: 25))
                        }
                        .onTapGesture {
                            dropDownText = "Anyone"
                            isShowing = false
                        }
                        Divider()
                        HStack{
                            Text("Your Major")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Image(systemName: "building.columns.circle")
                                .font(.system(size: 25))
                        }
                        .onTapGesture {
                            dropDownText = "Your Major"
                            isShowing = false
                        }
                        Divider()
                        HStack{
                            Text("Your Grade")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Image(systemName: "graduationcap")
                                .font(.system(size: 25))
                        }
                        .onTapGesture {
                            dropDownText = "Your Grade"
                            isShowing = false
                        }
                        Divider()
                        HStack{
                            Text("Your Groups")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading, 10)
                            Image(systemName: "rectangle.3.group.bubble.left")
                                .font(.system(size: 25))
                        }
                        .onTapGesture {
                            dropDownText = "Your Groups"
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
