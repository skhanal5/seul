//
//  ChatViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/7/22.
//

import Foundation

//Defines a Chat between a User and a Person -> redefine this later on definitely not structured right.

struct Chat: Identifiable {
    var id: UUID {person.id}
    let person: Person
    var messages: [Message]
    var hasReadMessage = false
}


//Consider constructing a User rather than creating another Person type instance.
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let profilePic: String
}

struct Message: Identifiable {
    
    enum MessageType {
        case Sent, Received
    }
    
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
    
}
