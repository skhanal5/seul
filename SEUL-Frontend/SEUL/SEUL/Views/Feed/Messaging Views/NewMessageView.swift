//
//  NewMessageView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/16/22.
//

import SwiftUI

struct NewMessageView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let receiver: UserModel
    
    @Binding var sent: Bool
    
    @State var messageTxt = ""
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: receiver.profilePic)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.leading, 5)
                            .foregroundColor(.gray)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.leading, 5)
                    case .failure:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.leading, 5)
                            .foregroundColor(.gray)
                    @unknown default:
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.leading, 5)
                            .foregroundColor(.gray)
                    }
                }
                Text(receiver.name)
                    .bold()
                    .font(.system(size: 20))
                Text(receiver.major)
                    .font(.system(size: 15))
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
            Divider()
            HStack {
                Text("Message:")
                    .padding(.leading, 70)
                Spacer()
            }
            .padding(.top, 10)
            TextEditor(text: $messageTxt)
                .padding()
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                .cornerRadius(30)
                .frame(width: 300, height: 300)
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(messageTxt.isEmpty ? .gray: Color(red: 174/255, green: 69/255, blue: 233/255))
                    .disabled(messageTxt.isEmpty ? true : false)
                    .onTapGesture {
                        if(messageTxt.isEmpty == false) {
                            createMessage()
                            sent = true
                            self.mode.wrappedValue.dismiss()
                        }
                    }
            }
        }
    }
    
    func createMessage() {
        viewModel.createChat(name: receiver.name, profilePic: receiver.profilePic, message: messageTxt)
    }
    
}
