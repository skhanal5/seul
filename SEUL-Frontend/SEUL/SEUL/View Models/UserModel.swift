//
//  UserModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/16/22.
//

import Foundation

struct UserModel: Identifiable {
    let id: Int
    let name: String
    let school: String
    let major: String
    let profilePic: String
    let clubs: [ClubListViewModel]
}
