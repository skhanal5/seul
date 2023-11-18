//
//  Filter.swift
//  SEUL
//
//  Created by Andy Zhao on 12/29/21.
//
import SwiftUI

struct Filter: View {
    @State private var sortIndex = 0
    @State private var locationIndex = 0
    @State private var qualityIndex = 0
    @State private var shippingIndex = 0
    @State private var listingTypeIndex = 0
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 0
    @State private var onSale = false
    
    private var quality = ["New", "Like New", "Average", "Acceptable", "Good", "Poor"]
    private var listingType = ["All listing", "Buy Now", "Auction", "Best Offer"]
    private var shipping = ["All", "Free Shipping", "Expedited"]
    private var sort = ["Best Match", "Newest", "Lowest to Highest", "Highest to Lowest"]
    private var location = ["Default", "US Only", "North America", "Worldwide"]
    
    /*
     * Different styles and functions for filtering data on
     * the preview screen
     *
     * Alpha : Nothing actually works atm
     */
    var body: some View {
        Form {
            Section(header: Text("General Settings")){
                
                Toggle(isOn: $onSale) {
                    Text("On Sale")
                }
                
                Picker(selection: $sortIndex, label: Text("Sort by")) {
                    ForEach(0..<sort.count) {
                        Text(self.sort[$0])
                    }
                }
                
                Picker(selection: $qualityIndex, label: Text("Quality")) {
                    ForEach(0..<quality.count) {
                        Text(self.quality[$0])
                    }
                }
                
                Picker(selection: $locationIndex, label: Text("Location")) {
                    ForEach(0..<location.count) {
                        Text(self.location[$0])
                    }
                }
                
                Picker(selection: $shippingIndex, label: Text(""), content: {
                    ForEach(0..<shipping.count) {
                        Text(self.shipping[$0])
                    }
                }).pickerStyle(SegmentedPickerStyle())
                
                Picker(selection: $listingTypeIndex, label: Text(""), content: {
                    ForEach(0..<listingType.count) {
                        Text(self.listingType[$0])
                    }
                }).pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Price")) {
                VStack {
                    Slider(value: $minPrice, in: 0...10000)
                    Text("Minimum Price: $\(minPrice, specifier: "%0.2f")")
                    
                    Slider(value: $maxPrice, in: minPrice...10000)
                    Text("Maximum Price: $\(maxPrice, specifier: "%0.2f")")
                }
            }
            
        } .navigationBarTitle("Filters")
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}
