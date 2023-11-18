//
//  MarketPlace.swift
//  SEUL
//
//  Created by Andy Zhao on 12/28/21.
//
import SwiftUI

struct MarketPlaceAlpha: View {
    @Binding var text: String
    @State private var isEditing = false
    var marketCollection = MarketCollection()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        
                        /* Search bar
                         *
                         * Note: Keyboard and clear doesn't work
                         * in preview
                         */
                        TextField("Search... ", text: $text)
                            .padding(7)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                    
                                    if isEditing {
                                        Button(action: {
                                            self.text = ""
                                        }) {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                })
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                self.isEditing = true
                            }
                        
                        if isEditing {
                            Button(action : {
                                self.isEditing = false
                                self.text = ""
                                
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                Text("Cancel")
                            }
                            .padding(.trailing, 10)
                            .transition(.move(edge: .trailing))
                            .animation(Animation.default, value: 0)
                        }
                        
                        NavigationLink(destination: Filter()) {
                            Image("Filter")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .trailing)
                        }
                    }
                    
                }
                .padding()
                
                Divider()
                    .background(Color.purple)
                    .frame(width: 370, height: 10)
                
                VerticalScrollViews(items: self.marketCollection.collection)
            }
            .background(Color.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct MarketPlaceAlpha_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceAlpha(text: .constant(""))
    }
}
