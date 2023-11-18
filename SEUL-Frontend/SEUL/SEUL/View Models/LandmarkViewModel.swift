//
//  LandmarkViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 12/30/21.
//

import Foundation
import MapKit

//Defines a Landmark on the Map.

struct LandmarkViewModel: Identifiable {
    
    let placemark: MKPlacemark
    let id = UUID()
    
    var name: String {
        placemark.name ?? ""
    }
    
    var title: String {
        placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        placemark.coordinate
    }
    
    var type: String
}
