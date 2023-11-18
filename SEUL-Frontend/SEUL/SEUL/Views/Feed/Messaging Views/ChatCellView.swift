//
//  ChatCellView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

struct ChatCellView: View {
    
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: chat.person.profilePic)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                case .failure:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                @unknown default:
                    Image(systemName: "circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(chat.person.name)
                        .bold()
                    Spacer()
                    Text(chat.messages.last?.date.descriptiveString() ?? "")
                }
                HStack {
                    Text(chat.messages.last?.text ?? "")
                        .foregroundColor(Color.gray)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 40)
                }
            }
        }.frame(height: 80)
    }
}
