//
//  DescriptionView.swift
//  SEUL
//
//  Created by Andy Zhao on 12/30/21.
//
import SwiftUI

struct DescriptionView: View {
    
    var item: MarketData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Spacer()
                
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
                
                Text(item.itemName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Divider()
                    .frame(width: 300)
                
                HStack(spacing: 35) {
                    
                    NavigationLink(destination: Profile()) {
                        Image(item.pfp).resizable().frame(width: 50, height: 50, alignment: .leading)
                    }
                    
                    VStack(spacing: 20) {
                        //Will be dynamic in the future
                        Text("December 31, 2021")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text(item.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                ContactSeller()
            }
        }
    }
}

/*
 * The button that is used in order to contact the seller
 *
 * Currently it brings you to Google.com
 */
struct ContactSeller: View {
    var body: some View {
        Link(destination: URL(string: "www.google.com")!, label: {
            Text("Contact Seller")
                .bold()
                .font(.title2)
                .frame(width: 280, height: 50)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .cornerRadius(15)
        })
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(item: MarketCollection().collection.first!)
    }
}
