//
//  MarketPlaceData.swift
//  SEUL
//
//  Created by Andy Zhao on 1/1/22.
//
import SwiftUI

struct MarketPlaceData: View {
    var body: some View {
        Text("Hello World")
    }
}

/*
 * A collection of items that would be displayed onto the screen
 */
struct MarketCollection {
    var collection = [MarketData(id: UUID(), itemName: "Boots", image: "Boots", description: "Just a pair of boots", price: 30.00, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Santa", image: "Santa", description: "Ho Ho Ho. I am santa", price: 100.00, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Snowflake", image: "Snowflake", description: "You don't see me due to global warming", price: 0, pfp: "Profile"), MarketData(id: UUID(), itemName: "Car", image: "Car", description: "The most expensive thing on this entire database right now. It is SO EXPENSIVE HOLY COW", price: 100000000, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Among Us", image: "Among Us", description: "I absolutely suck in this game, but it is a dead game right now so oh well", price: 14.99, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Hat", image: "Hat", description: "This is just a santa hat nothing too special about it besides that pretty much everything in here is Christmas themed when I did not intended it to be when I just searched for random PNG images without backgrounds on Google. I was surprised to find several useless pictures, but all of the pictures that I did find were apparently all Christmas themed. I did not intend for this to happen. Oh well", price: 5, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Christmas Tree", image: "Christmas Tree", description: "Tree", price: 100.0, pfp: "Profile"),
                      
                      MarketData(id: UUID(), itemName: "Robo Boots", image: "Robot Boots", description: "Bootleg IronMan", price: 3440.00, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Boots SM", image: "Boots", description: "Just a pair of boots", price: 310.00, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Boots M", image: "Boots", description: "Just a pair of boots", price: 500.00, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Boots XXL", image: "Boots", description: "Just a pair of boots", price: 30.40, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Boots For Sale", image: "Boots", description: "Just a pair of boots", price: 31.00, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Boots Not For Sale", image: "Boots", description: "Just a pair of boots", price: 60.00, pfp: "Profile"),
                      MarketData(id: UUID(), itemName: "Fake Boots", image: "Boots", description: "Just a pair of boots", price: 10.00, pfp: "Profile")]
}

/*
 * All of the data that each item would have. Some items are
 * commented out, which means that they would be added later on
 * in order to account for the filters.
 *
 * TLDR: Commented code are not used rn but will be implemented
 *       later
 */
struct MarketData : Identifiable {
    var id = UUID()
    var itemName = String()
    var image = String()
    var description = String()
    var price = Double()
    var pfp = String()
    // var quality = String()
    // var sale = Bool()
    // var shipping = String()
    // var location = String()
    // var dateAdded = Date()
}
