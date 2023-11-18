//
//  PlaceListViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 12/30/21.
//

import Foundation
import MapKit

//Defines a PlaceList containing Landmarks.

class PlaceListViewModel: ObservableObject {
    @Published var landmarks: [LandmarkViewModel] = []

    func searchLandmarks(searchTerm: String, searchType: String){
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        
        //region locked to UMD for now.
        request.region = MKCoordinateRegion(center:
                                                CLLocationCoordinate2D(latitude: 38.9869, longitude: -76.9426), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error {
                print(error)
                self.landmarks.removeAll()
            } else if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    return LandmarkViewModel(placemark: $0.placemark, type: searchType)
                }
            }

        }
    }
}
