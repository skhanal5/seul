//
//  Maps.swift
//  SEUL
//
//  Created by Harpreet Multani on 12/28/21.
//

import MapKit
import SwiftUI

//Variable to check if the sidebar is expanded. I put it here for now because this variable is needed in multiple view definitions. Not sure if this is the right convention for global state variables?
private var expanded = false

//Contains the main definition for the Map screen
struct Maps: View {
    
    //Contains the current search query
    @State private var searchText = "";
    
    //Used to maintain the state of the sidebar later on
    @State private var size = UIScreen.main.bounds.width / 1
    
    //Defines the current region of the map -> defined as UMD currently
    @State private var region = MKCoordinateRegion(center:
                                            CLLocationCoordinate2D(latitude: 38.9869, longitude: -76.9426), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    /* The variables below are used to check if certain
     filters are toggled
     */
    
    @State private var restaurantCheck = false
    
    @State private var fastfoodCheck = false
    
    @State private var coffeeCheck = false
    
    @State private var gasCheck = false
    
    @State private var poiCheck = false
    
    @State private var studyCheck = false
    
    @State private var searchComplete = false
    
    @State private var searching = false
    
    @StateObject var placeListVM = PlaceListViewModel()
    
    //Custom tab icons from SF Symbols
    let tabIcons = ["person.badge.plus", "location.square",
                    "bubble.left", "tag", "person.circle"]
    
    var body: some View {
        /* I think using a ZStack would've been a lot better here. Probably a good change to consider
           going forward with this code considering the overlapping elements */
        VStack(spacing: 0) {
            
            //Contains the content at the top of the screen
            VStack {
                
                //Contains the textfield for the search bar and filters button
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 10.0)
                        TextField("Search", text: $searchText).onTapGesture {
                            if (searchComplete && searchText.count > 0) {
                                searchText = ""
                                searching = false
                            }
                        }.frame(height: 30)
                    }.background(Color(red: 242/255, green: 243/255, blue: 245/255))
                        .cornerRadius(8)
                    HStack {
                        Button(action: {
                            self.size = -size/2
                            expanded.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color.black)
                        })                        .disabled(searching ? true: false)
                    }.padding()
                }.disabled(expanded ? true : false)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.white)
            }.onChange(of: searchText, perform: { value in      //relocate this code down below maybe
                if searchText == "" {
                    searchComplete = false
                }
                if(!searchComplete && searchText != "") {
                    searching = true
                    let delay = 0.3
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        if value == searchText {
                            placeListVM.searchLandmarks(searchTerm: searchText, searchType: "query")
                        }
                    }
                }
            })
            Divider()
            
            //Contains the map in the center of the screen
            ZStack() {
                
            
               Map(coordinateRegion: $region, interactionModes: .all, annotationItems: placeListVM.landmarks) { landmark in
                    MapAnnotation(coordinate: landmark.coordinate) {
                        PlaceAnnotationView(type: landmark.type, title: landmark.name)
                    }
                }.onChange(of: restaurantCheck) { value in
                    if (value) {
                        if (fastfoodCheck) {
                            CheckBoxView(checked: $fastfoodCheck).checked.toggle()
                        } else if (coffeeCheck) {
                            CheckBoxView(checked: $coffeeCheck).checked.toggle()
                        } else if (gasCheck) {
                            CheckBoxView(checked: $gasCheck).checked.toggle()
                        } else if (studyCheck) {
                            CheckBoxView(checked: $studyCheck).checked.toggle()
                        } else if (poiCheck) {
                            CheckBoxView(checked: $poiCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Restaurants", searchType: "Restaurant")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }.onChange(of: fastfoodCheck) { value in
                    if (value) {
                        if (restaurantCheck) {
                            CheckBoxView(checked: $restaurantCheck).checked.toggle()
                        } else if (coffeeCheck) {
                            CheckBoxView(checked: $coffeeCheck).checked.toggle()
                        } else if (gasCheck) {
                            CheckBoxView(checked: $gasCheck).checked.toggle()
                        } else if (studyCheck) {
                            CheckBoxView(checked: $studyCheck).checked.toggle()
                        } else if (poiCheck) {
                            CheckBoxView(checked: $poiCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Fast Food", searchType: "Fast Food")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }.onChange(of: coffeeCheck) { value in
                    if (value) {
                        if (restaurantCheck) {
                            CheckBoxView(checked: $restaurantCheck).checked.toggle()
                        } else if (fastfoodCheck) {
                            CheckBoxView(checked: $fastfoodCheck).checked.toggle()
                        } else if (gasCheck) {
                            CheckBoxView(checked: $gasCheck).checked.toggle()
                        } else if (studyCheck) {
                            CheckBoxView(checked: $studyCheck).checked.toggle()
                        } else if (poiCheck) {
                            CheckBoxView(checked: $poiCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Coffee", searchType: "Coffee")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }.onChange(of: gasCheck) { value in
                    if (value) {
                        if (restaurantCheck) {
                            CheckBoxView(checked: $restaurantCheck).checked.toggle()
                        } else if (fastfoodCheck) {
                            CheckBoxView(checked: $fastfoodCheck).checked.toggle()
                        } else if (coffeeCheck) {
                            CheckBoxView(checked: $coffeeCheck).checked.toggle()
                        } else if (studyCheck) {
                            CheckBoxView(checked: $studyCheck).checked.toggle()
                        } else if (poiCheck) {
                            CheckBoxView(checked: $poiCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Gas", searchType: "Gas")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }.onChange(of: poiCheck) { value in
                    if (value) {
                        if (restaurantCheck) {
                            CheckBoxView(checked: $restaurantCheck).checked.toggle()
                        } else if (fastfoodCheck) {
                            CheckBoxView(checked: $fastfoodCheck).checked.toggle()
                        } else if (coffeeCheck) {
                            CheckBoxView(checked: $coffeeCheck).checked.toggle()
                        } else if (studyCheck) {
                            CheckBoxView(checked: $studyCheck).checked.toggle()
                        } else if (gasCheck) {
                            CheckBoxView(checked: $gasCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Tourist", searchType: "Tourist")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }.onChange(of: studyCheck) { value in
                    if (value) {
                        if (restaurantCheck) {
                            CheckBoxView(checked: $restaurantCheck).checked.toggle()
                        } else if (fastfoodCheck) {
                            CheckBoxView(checked: $fastfoodCheck).checked.toggle()
                        } else if (coffeeCheck) {
                            CheckBoxView(checked: $coffeeCheck).checked.toggle()
                        } else if (gasCheck) {
                            CheckBoxView(checked: $gasCheck).checked.toggle()
                        } else if (poiCheck) {
                            CheckBoxView(checked: $poiCheck).checked.toggle()
                        }
                        placeListVM.searchLandmarks(searchTerm: "Library", searchType: "Library")
                    } else {
                        placeListVM.searchLandmarks(searchTerm: "", searchType: "")
                    }
                }
                
            }.disabled((expanded ? true : false))
                .overlay {
                    
                    if searchText != "" && !placeListVM.landmarks.isEmpty && searchComplete == false {
                        ScrollView {
                            VStack (spacing: 15){
                                ForEach(placeListVM.landmarks){ place in
                                    Text(place.name)
                                        .foregroundColor(.black)
                                        .frame(width: .infinity, alignment:.leading)
                                        .padding()
                                        .onTapGesture {
                                            searchText = place.name
                                            searchComplete = true
                                            searching = false
                                            placeListVM.searchLandmarks(searchTerm: searchText, searchType: "")
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                        }
                                    Divider()
                                }
                            }
                        }.background(Color.white)
                    }
                    
                    
                HStack{
                    Menu(size: $size, restaurantCheck: $restaurantCheck, fastfoodCheck: $fastfoodCheck, coffeeCheck: $coffeeCheck,
                         gasCheck: $gasCheck, poiCheck: $poiCheck, studyCheck: $studyCheck)
                        .padding(.leading, -size)
                        .offset(x: 0)
                    Spacer()
                }.animation(.spring(), value: size)
            }
            Divider().padding(.bottom, 12.0)
            
        }.ignoresSafeArea(.keyboard)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
    }
}

//This defines a "Menu" which is a side menu in this case cause SwiftUI doesn't have one built-in for whatever reason lol
struct Menu: View {
    
    //Binding variable that lets us manipulate the size of sidebar
    @Binding var size : CGFloat
    
    /*
        The variables below will come in handy when checking
        the state of each individual filter.
     */
    @Binding var restaurantCheck: Bool
    
    @Binding var fastfoodCheck: Bool
    
    @Binding var coffeeCheck: Bool
    
    @Binding var gasCheck: Bool
    
    @Binding var poiCheck: Bool
    
    @Binding var studyCheck: Bool
    
    var radiusOptions = ["1 mile", "2 miles", "5 miles", "10 miles"]
    
    @State private var radiusIndex = 0
    
    // This checks if the disclosure group is expanded
    @State private var isExpanded = false

    //Defines the content in the sidebar -> the filter in this case
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            HStack(spacing: 30){
                Button(action: {
                    self.size = UIScreen.main.bounds.width / 1
                    expanded.toggle()
                }) {
                    Image(systemName: "arrow.backward.square")
                        .font(.system(size:24))
                }.padding()
                    .foregroundColor(Color.black)
                Text("Search Filters").font(.headline)
                Spacer()
            }.padding(.top, 30)
            
            HStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Restaurants").font(.headline)
                    Text("Fast Food").font(.headline)
                    Text("Coffee Shops").font(.headline)
                    Text("Gas Stations").font(.headline)
                    Text("Places of Interest").font(.headline)
                    Text("Study Lounges").font(.headline)
                }
                VStack(spacing: 23) {
                    CheckBoxView(checked: $restaurantCheck)
                    CheckBoxView(checked: $fastfoodCheck)
                    CheckBoxView(checked: $coffeeCheck)
                    CheckBoxView(checked: $gasCheck)
                    CheckBoxView(checked: $poiCheck)
                    CheckBoxView(checked: $studyCheck)
                }
                Spacer()
            }.padding(.leading, 40)
            
            /* Had to use this for the radius selector -> maybe
               this could be improved upon. Doesn't look that good imo. */
            VStack(alignment: .leading) {
                DisclosureGroup("Radius: \(radiusOptions[radiusIndex])", isExpanded: $isExpanded){
                    VStack {
                        ForEach(0..<4) { num in
                            Text(radiusOptions[num])
                                .font(.headline)
                                .onTapGesture {
                                    self.radiusIndex = num
                                    self.isExpanded.toggle()
                                }
                        }
                    }
                }.font(.headline)
                    .foregroundColor(Color.black)
                    .padding(.trailing, 55.5)
                    .accentColor(Color.black)
                    .frame(width:237)
                Spacer()
            }.padding(.bottom, 12)
            Spacer()
        }.frame(width: UIScreen.main.bounds.width / 1.3)
            .background(Color.white)
    }
}

//Defines a checkbox object -> obtained from a tutorial. Could be improved upon only defines a singular checkbox rather than a group.
struct CheckBoxView: View {
    
    @Binding var checked: Bool
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color(UIColor.black) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

//Defines the annotations for the map
struct PlaceAnnotationView: View {
    
    @State private var showTitle = true
    
    var type: String
    var title: String
    var body: some View {
        VStack(spacing: 0){
            
            Text(title)
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(showTitle ? 0 : 1)
            
            
            //first case is the default "pin" look
            if (type==""){
                Image(systemName: "mappin.circle.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.red)
                    .accentColor(Color.white)
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                    .offset(x: 0, y: -5)
            }else if (type=="Restaurant"){
                Image(systemName: "fork.knife.circle.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.orange)
                    .accentColor(Color.white)
            } else if (type=="Fast Food"){
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(Color(red:100/255,green:136/255,blue:19/255))
                    .accentColor(Color.white)
            }  else if (type=="Gas") {
                Image(systemName: "fuelpump.circle.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.blue)
                    .accentColor(Color.white)
            } else if (type=="Coffee") {
                Image(systemName: "cup.and.saucer.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.brown)
                    .accentColor(Color.white)
            } else if (type=="Tourist") {
                Image(systemName: "building.2.crop.circle.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.green)
                    .accentColor(Color.white)
            } else if (type=="Library") {
                Image(systemName: "book.fill")
                    .renderingMode(.original)
                    .font(.title)
                    .foregroundColor(.purple)
                    .accentColor(Color.white)
            }
        }.onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}

struct Maps_Previews: PreviewProvider {
    static var previews: some View {
        Maps()
    }
}
