//
//  ChatViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/16/22.
//

import Foundation

//Defines a Chat view model which contains Chat/User/Message objects 
class ChatsViewModel: ObservableObject {
    
    @Published var chats: [Chat] = []
    
    init() {
        let chat1 = Chat(person: Person(name: "Cindy", profilePic: "https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg"), messages: [
            Message("Hello", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Good evening.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("How are you?", type: .Sent, date: Date(timeIntervalSinceNow: -86400*2)),
            Message("Glad to be in your presence.", type: .Received, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("What are you up to?", type: .Sent, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("Nothing much, just hanging out online.", type: .Received, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("I see.", type: .Sent, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("You have great depth.", type: .Received, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("I know.", type: .Sent, date: Date(timeIntervalSinceNow: -86400*1))
        ])
        
       let chat2 = Chat(person: Person(name: "Malcolm", profilePic: "https://scontent-iad3-2.cdninstagram.com/v/t51.2885-19/s320x320/195354550_1197249560714716_9161167457486803270_n.jpg?_nc_ht=scontent-iad3-2.cdninstagram.com&_nc_cat=104&_nc_ohc=rnEZh3NCJyYAX_TR8Y-&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT834-OwgsJ_LaCZGAsfm_AHVOtqJ2pGonG9cyCwAIniAQ&oe=61EC6ABA&_nc_sid=7bff83?"), messages: [
            Message("Welcome, human.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("What is your favorite TV show and why?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Seek within your soul.", type: .Sent, date: Date(timeIntervalSinceNow: -86400*2)),
            Message("Which skill would you love to learn?", type: .Received, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("Speak in tongues", type: .Sent, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("What TV show or movie do you refuse to watch?", type: .Received, date: Date(timeIntervalSinceNow: -86400*1)),
            Message("IDK.", type: .Sent, date: Date(timeIntervalSinceNow: -86400*1))
        ])
        
      let chat3 = Chat(person: Person(name: "Amy", profilePic: ""), messages: [
            Message("Hey Amy, are you from Germany?", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Hey yes I am.", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Oh thats cool, how is your journey going?", type: .Sent, date: Date(timeIntervalSinceNow: -86400*2)),
            Message("Not so well, how about you?.", type: .Received, date: Date(timeIntervalSinceNow: -86400*1))
        ])
            
     let chat4 =   Chat(person: Person(name: "Jessie", profilePic: "https://media.istockphoto.com/photos/young-indian-female-university-student-stock-photo-picture-id1272817362?b=1&k=20&m=1272817362&s=170667a&w=0&h=PCkysqTLaomV9K67ocl9EbR0xqFz54_MW82DeglhNGQ="), messages: [
            Message("Hello", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Can you hear me?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Are you there?", type: .Received, date: Date(timeIntervalSinceNow: -86400*2)),
            Message("Hello??", type: .Received, date: Date(timeIntervalSinceNow: -86400*1))
        ])
        
        chats.append(chat1)
        chats.append(chat2)
        chats.append(chat3)
        chats.append(chat4)
    }
    
    func getSortedFilteredChat(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1>date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter{ $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    func createChat(name: String, profilePic: String, message: String){
        let newChat = Chat(person: Person(name: name, profilePic: profilePic), messages: [
            Message(message, type: .Sent)
        ])
        chats.append(newChat)
    }
    
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: {$0.id == chat.id}) {
            let message = Message(text, type: .Sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
    
    func getSectionMessages(for chat: Chat) -> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
            if let firstmessage = tmp.first {
                let daysBetween = firstmessage.date.daysBetween(date: message.date)
                if daysBetween >= 1 {
                    res.append(tmp)
                    tmp.removeAll()
                    tmp.append(message)
                } else {
                    tmp.append(message)
                }
            } else {
                tmp.append(message)
            }
        }
        res.append(tmp)
        return res
    }
    
}
