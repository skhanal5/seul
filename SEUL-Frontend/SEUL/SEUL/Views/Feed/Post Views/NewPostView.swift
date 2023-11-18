//
//  NewPostView.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/8/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct NewPostView: View {
    
    @Environment(\.presentationMode) var mode
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @State private var postText = "What would you like to post?"
    
    @State private var qnaText = "What do you want to ask?"
    
    @State private var showOptions = false
    
    @State private var showModal = true
    
    @State private var isPhotoActive = false
    
    @State private var isLocationActive = false
    
    @State private var isPollActive = false
    
    @State private var isQnAActive = false
    
    @State private var isTextActive = true
    
    @State private var dropDownText = "Anyone"
    
    @EnvironmentObject var feedListVM: FeedListViewModel

    var body: some View {
        VStack(spacing:0) {
            Divider()
            if (isPhotoActive) {
                VStack {
                    Image(systemName: "photo.on.rectangle")
                        .foregroundColor(Color(red: 215/255, green: 215/255, blue: 215/255))
                        .font(.system(size: 100))
                    Text("Select Photo")
                        .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                        .font(.system(size:15))
                        .padding(.top, 5)
                }
                .frame(width: 300, height: 175)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .cornerRadius(30)
                .padding(.top, 30)
            } else if (isLocationActive) {
                VStack {
                    Image(systemName: "location.square")
                        .foregroundColor(Color(red: 215/255, green: 215/255, blue: 215/255))
                        .font(.system(size: 100))
                    Text("Share your location")
                        .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                        .font(.system(size:15))
                        .padding(.top, 5)
                }
                .frame(width: 300, height: 175)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .cornerRadius(30)
                .padding(.top, 30)
            } else if (isPollActive) {
                VStack {
                    Image(systemName: "text.aligncenter")
                        .foregroundColor(Color(red: 215/255, green: 215/255, blue: 215/255))
                        .font(.system(size: 100))
                    Text("Create a Poll")
                        .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                        .font(.system(size:15))
                        .padding(.top, 5)
                }
                .frame(width: 300, height: 175)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                .cornerRadius(30)
                .padding(.top, 30)
            } else if (isQnAActive) {
                VStack {
                    TextEditor(text: $qnaText)
                        .padding()
                        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                        .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                        .cornerRadius(30)
                        .frame(width: 300, height: 100)
                        .onTapGesture {
                            showModal = false;
                            showOptions = false;
                            if (qnaText == "What do you want to ask?") {
                                qnaText = "";
                            }
                        }
                }.onAppear {
                    postText = "What would you like to post?";
                }.padding(.top, 30)
            }
            ZStack {
                TextEditor(text: $postText)
                    .padding()
                    .background(Color(red: 245/255, green: 245/255, blue: 245/255))
                    .foregroundColor(Color(red: 100/255, green: 100/255, blue: 100/255))
                    .cornerRadius(30)
                    .disabled(isQnAActive ? true: false)
                    .opacity(isQnAActive ? 0 : 1)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        showModal = false;
                        showOptions = false;
                        if (postText == "What would you like to post?") {
                            postText = "";
                        }
                    }

            }.padding(.top, 10)
            Spacer()
            Spacer()
            HStack(spacing: 30) {
                Spacer()
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(isPhotoActive ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    Image(systemName: "photo.on.rectangle")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                }
                .font(.system(size: 13))
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(isLocationActive ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    Image(systemName: "location.square")
                        .foregroundColor(.white)
                }
                .font(.system(size: 13))
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(isPollActive ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    Image(systemName: "text.aligncenter")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                }
                .font(.system(size: 13))
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(isQnAActive ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    Image(systemName: "questionmark.app")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                }
                .font(.system(size: 13))
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(isTextActive ? Color(red: 174/255, green: 69/255, blue: 233/255) : Color(red: 215/255, green: 215/255, blue: 215/255))
                    Image(systemName: "rectangle.slash")
                        .renderingMode(.original)
                        .foregroundColor(.white)
                }
                .font(.system(size: 13))
                Button(action: {
                    showModal = true;
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                }) {
                    ZStack {
                        Image(systemName: "chevron.up")
                            .renderingMode(.original)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            .padding()
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                    Rectangle()
                        .frame(maxHeight: .infinity/2, alignment: .bottom)
                }
                .foregroundColor(Color(red: 242/255, green: 243/255, blue: 245/255))
            }
            Divider()
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            showOptions = false
            showModal = false
        }
        .overlay {
            PostModalView(isShowing: $showOptions, dropDownText: $dropDownText)
        }
        .overlay {
            PostOptionView(isShowing: $showModal, isPhotoActive: $isPhotoActive, isLocationActive: $isLocationActive, isPollActive: $isPollActive, isQnAActive: $isQnAActive, isTextActive: $isTextActive)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    showOptions = true
                    showModal = false
                }) {
                    HStack {
                        Text(dropDownText)
                            .font(.system(size: 15))
                            .bold()
                        Image(systemName: "chevron.down")
                            .font(.system(size: 15))
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background() {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1.5)
                    }
                }
                Button(action: {
                    let post = ((postText.isEmpty || postText == "What would you like to post?") ? qnaText : postText);
                    let currUser = UserModel(id: 4, name: "You", school: "University of Maryland", major: "Computer Science", profilePic: "", clubs: [ClubListViewModel]());
                    feedListVM.createContent(id: 4, author: currUser, imageName: "", post: post, channel: "General")
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "checkmark.bubble.fill")
                }
                .disabled(((postText.isEmpty || postText == "What would you like to post?") && (qnaText == "" || qnaText == "What do you want to ask?")) ? true: false)
                .foregroundColor(((postText.isEmpty || postText == "What would you like to post?") && (qnaText == "" || qnaText == "What do you want to ask?"))  ? .gray : Color(red: 174/255, green: 69/255, blue: 233/255))
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
