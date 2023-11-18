//
//  MarketPlace.swift
//  SEUL
//
//  Created by Andy Zhao on 12/30/21.
//
import SwiftUI

struct MarketPlace: View {
    
    @Binding var text: String
    @State private var isEditing = false
    var items: [MarketData]
    
    var body: some View {
        NavigationView {
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
                            .frame(width: 33, height: 33, alignment: .trailing)
                    }
                    
                    Spacer()
                        .frame(width: 15)
                }
                List(items, id: \.id) { item in
                    NavigationLink(destination: DescriptionView(item: item), label: {
                        ItemCell(item: item)
                    })
                }
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
}

/*
 * Each item within the list view
 */
struct ItemCell: View {
    
    var item: MarketData
    
    var body: some View {
        HStack(spacing: 15) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .cornerRadius(4)
                .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.itemName)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct MarketPlace_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlace(text: .constant(""), items: MarketCollection().collection)
    }
}
