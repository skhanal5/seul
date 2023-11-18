//
//  FeedListViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/6/22.
//

import Foundation

//This defines a Feed List. It will come in handy once our backend is connected.
class FeedListViewModel: ObservableObject {
    @Published var feed: [UserContentModel] = []

    //Suppose we are generating this feed from our backend -> hardcoded in this case
    init(){
        
        let user1 = UserModel(id: 0, name: "Jessie Lotus", school: "University of Maryland", major: "Marketing", profilePic: "https://media.istockphoto.com/photos/young-indian-female-university-student-stock-photo-picture-id1272817362?b=1&k=20&m=1272817362&s=170667a&w=0&h=PCkysqTLaomV9K67ocl9EbR0xqFz54_MW82DeglhNGQ=", clubs: [ClubListViewModel]())
        
        let user2 = UserModel(id: 1, name: "Cindy Flowers", school: "University of Maryland", major: "Finance", profilePic: "https://st2.depositphotos.com/1594308/12210/i/950/depositphotos_122104490-stock-photo-smiing-female-college-student.jpg", clubs: [ClubListViewModel]())
        
        let user3 = UserModel(id: 2, name: "Amy Sanders", school: "University of Maryland", major: "Information Science", profilePic: "`", clubs: [ClubListViewModel]())
        
        let user4 = UserModel(id: 3, name: "Malcolm Qiu", school: "University of Maryland", major: "Finance", profilePic: "https://scontent-iad3-2.cdninstagram.com/v/t51.2885-19/s320x320/195354550_1197249560714716_9161167457486803270_n.jpg?_nc_ht=scontent-iad3-2.cdninstagram.com&_nc_cat=104&_nc_ohc=rnEZh3NCJyYAX_TR8Y-&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT834-OwgsJ_LaCZGAsfm_AHVOtqJ2pGonG9cyCwAIniAQ&oe=61EC6ABA&_nc_sid=7bff83?", clubs: [ClubListViewModel]())
        
        let userContent1 = UserContentModel(id: 0, author: user1, imageName: "", post: "I am a freshman of UMD trying to figure out what clubs I should join. I am a marketing major who loves design and public speaking. I don't know what applications are open need help deciding a great club that I can invest my time in. PLEASE let me know if anyone knows of any clubs that are looking for new members. Hope to find some new friends.", channel: "General")
        
        let userContent2 = UserContentModel(id: 1, author: user2, imageName: "https://www.popsci.com/uploads/2021/08/05/pexels-skyler-ewing-7830065-scaled.jpg?auto=webp", post: "Look at this cute squirrel. I know everyone is stressed with finals right now, just wanted to show y'all this cute squirrel I captured on my walk to class.", channel: "General")
        
        let userContent3 = UserContentModel(id: 2, author: user3, imageName: "", post: "I found an umbrella at STAMP. Let me know who's it is and we can meet up.", channel: "Lost-and-Found")
        
        let userContent4 = UserContentModel(id: 3, author: user4, imageName: "", post: "Hitting Immortal is easy I just don't have the time to do it. I could play in anyone's ELO right now and still dominate Matt. The ranks truly do not mean nothing.", channel: "General")
        
        feed.append(userContent1)
        feed.append(userContent2)
        feed.append(userContent3)
        feed.append(userContent4)
    }
    
    func createContent(id: Int, author: UserModel, imageName: String, post: String, channel: String) {
        let content = UserContentModel(id: id, author: author, imageName: imageName, post: post, channel: channel)
        feed.append(content)
    }
}

