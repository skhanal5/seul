//
//  ClubListViewModel.swift
//  SEUL
//
//  Created by Subodh Khanal on 1/9/22.
//

import Foundation

//This defines a Club List. It will come in handy once our backend is connected.
class ClubListViewModel: ObservableObject {
    @Published var clubList: [ClubModel] = []
    @Published var userClubs: [ClubModel] = []

    //Suppose we are generating this feed from our backend -> hardcoded in this case
    init(){
        
        let clubList1 = ClubModel(id: 0, clubName: "Accounting and Business Association", clubEvents: [String]() , clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "The Accounting and Business Association is a place for students to connect with firms and expand their foundation to prepare for the next step. The ABA invites a variety of firms to the University of Maryland to allow students to learn about opportunities, expand their networks, and develop their professional careers.")
            
        
        let clubList2 = ClubModel(id: 1, clubName: "Asian American Student Union", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "The mission of the AASU is to provide service, representation, and advocacy for the Asian American Pacific Islander community at the University of Maryland.")
        
        let clubList3 = ClubModel(id: 2, clubName: "Active Minds at Maryland", clubEvents: [String](), clubVid:"", clubBanner:"", clubProfilePic: "", clubDescription: "Everyone has mental health and so everyone has a part to play in Active Minds. Chapters create compassionate communities of support and hope that extends beyond their group and influences all aspects of campus life. Active Minds works to increase mental health awareness on campus, raise funds for critical mental health education and resources through the Active Minds national office, promote positive mental health, educate their peers about the signs and symptoms of mental health disorders, and encourage students to reach out for help when needed. Powered by more than 550 chapters located at high schools and colleges nationwide, Active Minds plays an important role in referring students to resources and starting conversations about this important topic. Each year, more than 15,000 students join an Active Minds high school or college chapter to serve as passionate advocates, stigma fighters, and educators for mental health.")
        
        let clubList4 = ClubModel(id: 3, clubName: "Bitcamp", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "Bitcamp is the University of Maryland's premier hackathon, bringing together over 1,200 students, making it one of the largest east coast collegiate hackathons. Top student developers, designers, builders, and thinkers from around the country will come to College Park and spend 36 hours working on websites, apps, and hardware projects. Bitcamp is a place for influencing a diverse group of the nation’s brightest makers, all working on different projects and possessing different skill sets, and educating the next generation of technologists.")
        
        let clubList5 = ClubModel(id: 4, clubName: "Boxing Club", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "The Boxing Club is established for the expressed purpose of providing a safe and friendly atmosphere for learning boxing skills and techniques for building stamina to compete as a boxer. The Boxing Club shall also provide an outlet for boxing competition against the other collegiate teams that exist within the United States Intercollegiate Boxing Association for those who wish to compete.")
        
        let clubList6 = ClubModel(id: 5, clubName: "Business & Information Technology Society", clubEvents: [String]() , clubVid:"", clubBanner:"", clubProfilePic: "", clubDescription: "The Business and Information Technology Society (BITS) is an undergraduate student organization located within the Robert H. Smith School of Business. Our organization dedicates itself to the idea that technology has emerged as a powerful, dynamic force amid today’s business environment; therefore, the ability to understand, utilize, and communicate business technology & data is paramount to the success of any business.")
        
        let clubList7 = ClubModel(id: 6, clubName: "Business in Health", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "The purpose of this organization is to recognize the impact of business in the world of health. Our organization plans to educate people on the integration of business and health. It is both a social and educational organization, in which students are welcome to meet other students in the organization as well as learn about how and why business is important in the medical field. The group was founded because we wish to educate others involved in the organization on the different decisions and actions that are taken by business leaders and the variety of business models and concepts that serve to provide assistance to those in health. We wish to establish how business leaders can make an impact on the world of health and/or in the medical field.")
        
        let clubList8 = ClubModel(id: 7, clubName: "Calisthenics Club", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "Calisthenics Club is a group of students determined to improve fitness through body weight training! Come join us!")

        let clubList9 = ClubModel(id: 8, clubName: "Career Science Club", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "CSC is a student-led organization that is committed to assisting our members secure a job offer. We provide info sessions, guides, and workshops on all the steps of the hiring process. Join us every Tuesday to build your professional network and rebuild your post-covid social life. Interested? Connect with us on here and GroupMe! We are primarily a computer science club, but all majors are welcome!")
        
        let clubList10 = ClubModel(id: 9, clubName: "Chinese Student Association", clubEvents: [String](), clubVid:"", clubBanner: "https://images.squarespace-cdn.com/content/v1/5e03b8e01c79407e08daca22/1577306041024-ZTOGPG0O2YM3JR6BMH27/Board", clubProfilePic: "", clubDescription: "Chinese Student Organization at the University of Maryland is a social and cultural organization dedicated to maintaining a welcoming, fun, and vibrant community. Want to learn more about Chinese culture? Want to meet new people and make new friends? Want to participate in fun events? We got you covered! Join the CSA fam!")
        
        let clubList11 = ClubModel(id: 10, clubName: "DeFi Society", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "Our mission is to drive education, research, and collaboration in the DeFi industry. We strive to connect Smith students and CS students with guest speakers and employers.")
        
        let clubList12 = ClubModel(id: 11, clubName: "Department of Plant Science and Landscape Architecture", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "Would you like to contribute to a sustainable future and enhanced environmental quality through design, conservation and management of plants and other natural resources, and the planning, design and management of landscapes?")
        
        let clubList13 = ClubModel(id: 12, clubName: "Disability: Identity, Culture, and Education", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "Disability: Identity, Culture, and Education (DICE) is a student led disability justice collective at the University of Maryland. We strive to promote disability justice by building a community of supportive individuals and empowering students to implement change.")
        
        let clubList14 = ClubModel(id: 13, clubName: "Engineers Without Borders", clubEvents: [String](), clubVid:"", clubBanner: "", clubProfilePic: "", clubDescription: "The mission of \"EWB\" is to partner with disadvantaged communities to improve their quality of life through implementation of environmentally and economically sustainable engineering projects, while developing internationally responsible engineering students.")
        
        clubList.append(clubList1)
        clubList.append(clubList2)
        clubList.append(clubList3)
        clubList.append(clubList4)
        clubList.append(clubList5)
        clubList.append(clubList6)
        clubList.append(clubList7)
        clubList.append(clubList8)
        clubList.append(clubList9)
        clubList.append(clubList10)
        clubList.append(clubList11)
        clubList.append(clubList12)
        clubList.append(clubList13)
        clubList.append(clubList14)
        
        //simulating us retrieving current User's clublist.
        userClubs.append(clubList1)
        userClubs.append(clubList10)
        userClubs.append(clubList14)
    }
    
    func searchResults(query: String) -> [ClubModel] {
        if (query.isEmpty) {
            return clubList
        } else {
            return clubList.filter {$0.clubName.lowercased().contains(query.lowercased())}
        }
    }
    
    func addClubToList(club: ClubModel) {
        userClubs.append(club)
    }
}
