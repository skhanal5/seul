//
//  UserViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/6/22.
//

import Foundation

/* Defines "User Content." This will be more practical in use when we connect the backend database. */
struct UserContentModel: Identifiable {
    let id: Int
    let author: UserModel
    let imageName: String
    let post: String
    let channel: String
    //consider adding a Time feature similar to that in a "Chat."
}
