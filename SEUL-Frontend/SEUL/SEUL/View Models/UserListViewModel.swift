//
//  UserListViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/16/22.
//

import Foundation


// This defines a list of all of the Users in the school. Need for directory purposes in MessageView
// Different from FeedList view b/c not all Users may appear in the Feed.
class UserListViewModel: ObservableObject {
    @Published var userList: [UserModel] = []
    
    //simulate retrieving list of all users.
    init() {
        let user1 = UserModel(id: 0, name: "Jessie Lotus", school: "University of Maryland", major: "Marketing", profilePic: "https://media.istockphoto.com/photos/young-indian-female-university-student-stock-photo-picture-id1272817362?b=1&k=20&m=1272817362&s=170667a&w=0&h=PCkysqTLaomV9K67ocl9EbR0xqFz54_MW82DeglhNGQ=", clubs: [ClubListViewModel]())
        
        let user2 = UserModel(id: 1, name: "Cindy Flowers", school: "University of Maryland", major: "Finance", profilePic: "https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg", clubs: [ClubListViewModel]())
        
        let user3 = UserModel(id: 2, name: "Amy Sanders", school: "University of Maryland", major: "Information Science", profilePic: "`", clubs: [ClubListViewModel]())
        
        let user4 = UserModel(id: 3, name: "Malcolm Qiu", school: "University of Maryland", major: "Finance", profilePic: "https://scontent-iad3-2.cdninstagram.com/v/t51.2885-19/s320x320/195354550_1197249560714716_9161167457486803270_n.jpg?_nc_ht=scontent-iad3-2.cdninstagram.com&_nc_cat=104&_nc_ohc=rnEZh3NCJyYAX_TR8Y-&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT834-OwgsJ_LaCZGAsfm_AHVOtqJ2pGonG9cyCwAIniAQ&oe=61EC6ABA&_nc_sid=7bff83?", clubs: [ClubListViewModel]())
        
        let user5 = UserModel(id: 4, name: "Domingo Hernandez", school: "University of Maryland", major: "Information Science", profilePic: "", clubs: [ClubListViewModel]())
        
        let user6 = UserModel(id: 5, name: "Wardell Curry", school: "University of Maryland", major: "Biology", profilePic: "", clubs: [ClubListViewModel]())
        
        let user7 = UserModel(id: 6, name: "Anthony Davis", school: "University of Maryland", major: "Astronomy", profilePic: "", clubs: [ClubListViewModel]())
        
        let user8 = UserModel(id: 7, name: "Cade Cunningham", school: "University of Maryland", major: "Kinesiology", profilePic: "", clubs: [ClubListViewModel]())
        
        let user9 = UserModel(id: 8, name: "Kentrell Gaulden", school: "University of Maryland", major: "Agriculture", profilePic: "", clubs: [ClubListViewModel]())
        
        let user10 = UserModel(id: 9, name: "Yao Ming", school: "University of Maryland", major: "Finance", profilePic: "", clubs: [ClubListViewModel]())
        
        let user11 = UserModel(id: 10, name: "Navraj Singh", school: "University of Maryland", major: "English", profilePic: "", clubs: [ClubListViewModel]())
        
        let user12 = UserModel(id: 11, name: "Aubrey Graham", school: "University of Maryland", major: "Mathematics", profilePic: "", clubs: [ClubListViewModel]())
        
        let user13 = UserModel(id: 12, name: "Lebron James", school: "University of Maryland", major: "English", profilePic: "", clubs: [ClubListViewModel]())
        
        let user14 = UserModel(id: 13, name: "Mart Schmidt", school: "University of Maryland", major: "Information Science", profilePic: "", clubs: [ClubListViewModel]())
        
        let user15 = UserModel(id: 14, name: "Emily Williams", school: "University of Maryland", major: "Information Science", profilePic: "", clubs: [ClubListViewModel]())
        
        let user16 = UserModel(id: 15, name: "Zion Williamson", school: "University of Maryland", major: "Biology", profilePic: "", clubs: [ClubListViewModel]())
        
        let user17 = UserModel(id: 16, name: "Serena Williams", school: "University of Maryland", major: "Chemistry", profilePic: "", clubs: [ClubListViewModel]())
        
        let user18 = UserModel(id: 17, name: "Vince McMahon", school: "University of Maryland", major: "Mathematics", profilePic: "", clubs: [ClubListViewModel]())
        
        let user19 = UserModel(id: 18, name: "Tina Jones", school: "University of Maryland", major: "Geology", profilePic: "", clubs: [ClubListViewModel]())
        
        let user20 = UserModel(id: 19, name: "Amanda Lake", school: "University of Maryland", major: "Physics", profilePic: "", clubs: [ClubListViewModel]())
        
        let user21 = UserModel(id: 20, name: "Larissa Lee", school: "University of Maryland", major: "English", profilePic: "", clubs: [ClubListViewModel]())
        
        let user22 = UserModel(id: 21, name: "Francis Key", school: "University of Maryland", major: "Journalism", profilePic: "", clubs: [ClubListViewModel]())
        
        let user23 = UserModel(id: 22, name: "Isabella Smith", school: "University of Maryland", major: "Communications", profilePic: "", clubs: [ClubListViewModel]())
        
        let user24 = UserModel(id: 23, name: "Beth Lucas", school: "University of Maryland", major: "Business", profilePic: "", clubs: [ClubListViewModel]())
        
        let user25 = UserModel(id: 24, name: "Olivia McMahon", school: "University of Maryland", major: "Economics", profilePic: "", clubs: [ClubListViewModel]())
        
        let user26 = UserModel(id: 25, name: "Gabriela Banales", school: "University of Maryland", major: "Computer Science", profilePic: "", clubs: [ClubListViewModel]())
        
        userList.append(user1)
        userList.append(user2)
        userList.append(user3)
        userList.append(user4)
        userList.append(user5)
        userList.append(user6)
        userList.append(user7)
        userList.append(user8)
        userList.append(user9)
        userList.append(user10)
        userList.append(user11)
        userList.append(user12)
        userList.append(user13)
        userList.append(user14)
        userList.append(user15)
        userList.append(user16)
        userList.append(user17)
        userList.append(user18)
        userList.append(user19)
        userList.append(user20)
        userList.append(user21)
        userList.append(user22)
        userList.append(user23)
        userList.append(user24)
        userList.append(user25)
        userList.append(user26)
    }
    
    func searchResults(query: String) -> [UserModel] {
        if (query.isEmpty) {
            return userList
        } else {
            return userList.filter {$0.name.lowercased().contains(query.lowercased())}
        }
    }
    
}
