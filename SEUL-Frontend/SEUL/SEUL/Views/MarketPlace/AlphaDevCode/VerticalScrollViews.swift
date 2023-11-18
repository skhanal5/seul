//
//  VerticalScrollViews.swift
//  SEUL
//
//  Created by Andy Zhao on 12/29/21.
//
import SwiftUI

/*
 * Displays the all of the information within the
 * MarketCollection. It will link each item to their respective
 * preview pages
 *
 * Alpha: Clicking on the views would only bring up a blank page
 */
struct VerticalScrollViews: View {
    var items : [MarketData]
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<self.items.count) {col in
                    NavigationLink(destination: DescriptionView(item: self.items[col])) {
                            VStack {
                                Cell(data: self.items[col])
                            }
                            .background(Color.white)
                            .padding()
                    }
                }
            }
            .background(Color.gray)
        }
    }
}

/*
 * The implementation and action for one item view
 *
 * Alpha:
 * Actions : PFP -> Profile view
 *           Everything else -> Blank page with the item name
 */
struct Cell : View {
    var data : MarketData
    var body: some View {
        HStack {
            
            NavigationLink(destination: Text(data.itemName)) {
                Image(data.image).resizable().frame(width: 75, height: 75, alignment: .leading).cornerRadius(10)
            }
            
            Spacer()
                .frame(width: 15)
            
            VStack(alignment: .leading) {
                HStack {
                    
                    NavigationLink(destination: Profile()) {
                        Image(data.pfp).resizable().frame(width: 25, height: 25, alignment: .leading)
                    }
                
                    NavigationLink(destination: Text(data.itemName)) {
                            Text(data.itemName)
                                .foregroundColor(.black)
                                .font(Font.system(size: 23))
                                .bold()
                        }
                    }
                    Divider()
                        .background(Color.purple)
                    Text(data.description)
                        .foregroundColor(.black)
                        .font(.subheadline)
            }
            Spacer()
          
            NavigationLink(destination: Text(data.itemName)) {
                Text("$\(data.price, specifier: "%.2f")")
                    .foregroundColor(Color.black)
            }
            
       }
        .padding()
        .frame(width: 365, height: 135, alignment: .leading)
    }
}


struct VerticalScrollViews_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrollViews(items: MarketCollection().collection)
    }
}
