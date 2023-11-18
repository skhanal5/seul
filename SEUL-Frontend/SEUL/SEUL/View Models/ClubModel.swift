//
//  ClubViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/9/22.
//

import Foundation

//Defines a "Club"/
struct ClubModel: Identifiable {
    
    let id: Int
    let clubName: String
    let clubEvents: [String]
    let clubVid: String //no idea what to use in this case.
    let clubBanner: String
    let clubProfilePic: String
    let clubDescription: String
    
}
