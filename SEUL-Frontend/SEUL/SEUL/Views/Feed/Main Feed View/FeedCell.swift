//
//  FeedCell.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

struct FeedCell: View {
    let post: UserContentModel
    
    var header: some View {
        HStack {
            AsyncImage(url: URL(string: post.author.profilePic)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                case .failure:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                @unknown default:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading) {
                Text(post.author.name).font(.system(size: 14)).bold()
                Text(post.author.school + " - " + post.author.major).font(.system(size: 12))
            }
            Spacer()
        }.padding(.top, 10)
    }
    
    var actionButtons: some View {
        HStack{
            Image(systemName: "heart")
                .foregroundColor(Color(.label))
                .onTapGesture{
                    print("liked")
                }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 8))
            Image(systemName: "message")
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 8))
            Image(systemName: "square.and.arrow.up")
                .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 8))
            Spacer()
            Image(systemName: "ellipsis.circle")
        }.font(.system(size: 18, weight: .light))
            .padding(.top, 5)
    }

    
    var body: some View{
        VStack {
            header
            VStack(alignment: .leading) {
                Text("#" + post.channel)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .bottom], 4.5)
                    .font(.system(size: 15))
                          
                Text(post.post)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            AsyncImage(url: URL(string: post.imageName)) { phase in
                switch phase {
                case .empty:
                    if(post.imageName==""){
                        EmptyView()
                    } else {
                        ProgressView() //I have no idea how to fix this bug.                    Remind me******
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 390, height: 390)
                        .clipped()
                        .cornerRadius(10)
                case .failure:
                    EmptyView() //change this to no image warning
                @unknown default:
                    EmptyView() //change this to no image warning
                }
            }
            
            actionButtons
        }
    }
}
