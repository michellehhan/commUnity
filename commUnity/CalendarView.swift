//
//  CalendarView.swift
//  commUnity
//
//  Created by Michelle Han on 10/18/23.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentPage: String = "calendar"
    var body: some View {
        NavigationView{
            VStack(spacing: 15) {
                
                // Navigation Bar
                HStack {
                    ZStack {
                        // Background first
                        Color(hex: "#FFFFFF")
                            .cornerRadius(15)
                            .frame(width: 50, height: 50)
                        
                    }
                    .padding(.top,60)
                    .padding(.bottom,10)
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        HStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            
                            Text("commUnity")
                                .font(.system(size: 25)).bold()
                                .foregroundColor(Color.black)
                        }
                        
                    }.padding(.top, 60).padding(.bottom, 5)
                    
                    Spacer()
                    
                    ZStack {
                        // Background first
                        Color(hex: "#87C381")
                            .cornerRadius(15)
                            .frame(width: 50, height: 50) // Adjust to desired size
                        
                        // Then the Image
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                    }
                    .padding(.top,60)
                    .padding(.trailing,10)
                }
                .padding(.horizontal)
                HStack{
                    Image(systemName: "location")
                        .foregroundColor(.black)
                    Text("Granite Bay, CA")}.font(.system(size: 16)).foregroundColor(Color.black).padding(9)
                    .background(Color(hex: "#CBF1F8"))
                    .cornerRadius(10).padding(.bottom, 8)
                                
                
                ScrollView {
                        
                    CombinedActivityAndProfile(
                        activityImage: "protest",
                        activityTitle: "Roseville Green Summit 2023",
                        activityDate: "OCT 15, 9AM - 5PM",
                        activityDistance: "2.4 MILES",
                        activityDescription: "Unite for change at the Green Harmony Summit: where passion meets action for a sustainable tomorrow.",
                        profileImage: "pfp_picnic",
                        profileUserName: "Sarah Smith",
                        profileLikes: 12,
                        profileComments: 7
                    )
                    
                    CombinedActivityAndProfile(
                        activityImage: "read",
                        activityTitle: "Rallying For Reading Rights @ Granite Bay High School",
                        activityDate: "OCT 17, 3PM - 5PM",
                        activityDistance: "4.3 MILES",
                        activityDescription: "Join us in opposing censorship and book bans. Prominent voices will deliver speeches, sharing their insights and experiences.",
                        profileImage: "pfp_picnic",
                        profileUserName: "Sarah Smith",
                        profileLikes: 19,
                        profileComments: 11
                    )

                    
                }
                // Bottom Navigation Bar
                HStack {
                    if currentPage != "calendar" {
                        NavigationLink(destination: ProfileView().onAppear {
                            self.currentPage = "calendar"
                        }) {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                                .clipShape(Circle())
                        }
                        .padding(.trailing) // padding on the side
                    } else {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                            .clipShape(Circle())
                        .padding(.leading) // padding on the side
                    } // padding on the side
                    
                    Spacer()
                    
                    NavigationLink(destination: MessageView().navigationBarBackButtonHidden(true).onAppear {
                        self.currentPage = "message"
                    }) {
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: CommunityProfileView().navigationBarBackButtonHidden(true).onAppear {
                        self.currentPage = "communityProfile"
                    }) {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination:  NewsView().navigationBarBackButtonHidden(true).onAppear {
                        self.currentPage = "news"
                    }) {
                        Image(systemName: "newspaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true).onAppear {
                        self.currentPage = "profile"
                    }) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .padding(.trailing) // padding on the side
                }
                
                .padding()
                .background(Color.gray.opacity(0.1))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }.navigationBarBackButtonHidden(true)
    }
    
    struct ActivityRow: View {
        var image: String
        var title: String
        var date: String
        var distance: String
        var description: String
        
        var body: some View {
            VStack {
                VStack(alignment: .leading) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                    
                    Text(title)
                        .font(.system(size: 21)).padding(.bottom, 2).padding(.top,6)
                    
                    HStack {
                        // Calendar and date
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.white)
                            Text(date)
                                .font(.system(size: 14))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(5)
                        .background(Color(hex: "#84B3BF"))
                        .cornerRadius(10)
                        
                        Spacer()
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.white)
                            Text(distance)
                                .font(.system(size: 14))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                        }
                        .padding(5)
                        .background(Color(hex: "#84B3BF"))
                        .cornerRadius(10)
                    }
                    
                    Text(description)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                }
            }
        }
    }
    
    struct ProfileInfoView: View {
        var profileImage: String
        var userName: String
        var likes: Int
        var comments: Int
        
        var body: some View {
            VStack {
                HStack(spacing: 12) {
                    // Profile Picture
                    Image(profileImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    
                    // Name
                    Text(userName)
                        .font(.system(size: 17, weight: .medium))
                    
                    Spacer()
                    
                    // Likes
                    HStack(spacing: 5) {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.black)
                        Text("\(likes)")
                            .font(.system(size: 17))
                    }.padding(.horizontal,7)
                    
                    // Comments
                    HStack(spacing: 5) {
                        Image(systemName: "text.bubble")
                            .foregroundColor(.black)
                        Text("\(comments)")
                            .font(.system(size: 17))
                    }
                    
                    // More Icon with Context Menu
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .contextMenu {
                            Button(action: {
                                // Action for Bookmark
                                print("Bookmark tapped!")
                            }) {
                                Label("Bookmark", systemImage: "bookmark")
                            }
                            
                            Button(action: {
                                // Action for Message the Organizer
                                print("Message the Organizer tapped!")
                            }) {
                                Label("Message the Organizer", systemImage: "message")
                            }
                            
                            Button(action: {
                                // Action for More Details
                                print("More Details tapped!")
                            }) {
                                Label("More Details", systemImage: "info.circle")
                            }
                        }
                }
                .padding(.trailing, 12).padding(.top, 6)
            }
        }
    }

    struct CombinedActivityAndProfile: View {
        var activityImage: String
        var activityTitle: String
        var activityDate: String
        var activityDistance: String
        var activityDescription: String
        var profileImage: String
        var profileUserName: String
        var profileLikes: Int
        var profileComments: Int

        @State private var showingActionSheet = false

        var body: some View {
            VStack(spacing: 0) { // no spacing to ensure continuous background
                VStack {
                    ActivityRow(
                        image: activityImage,
                        title: activityTitle,
                        date: activityDate,
                        distance: activityDistance,
                        description: activityDescription
                    ).padding(.bottom, 2)
                    
                    HStack(spacing: 12) {
                        // Profile Picture
                        Image(profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        // Name
                        Text(profileUserName)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        // Likes
                        HStack(spacing: 5) {
                            Image(systemName: "hand.thumbsup")
                                .foregroundColor(.black)
                            Text("\(profileLikes)")
                                .font(.system(size: 17))
                        }.padding(.trailing,3)
                        
                        // Comments
                        HStack(spacing: 5) {
                            Image(systemName: "text.bubble")
                                .foregroundColor(.black)
                            Text("\(profileComments)")
                                .font(.system(size: 17))
                        }.padding(.horizontal,3)
                        
                        // More Options
                        Button(action: {
                            showingActionSheet = true
                        }) {
                            Image(systemName: "ellipsis.circle").font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        .actionSheet(isPresented: $showingActionSheet) {
                            ActionSheet(title: Text("Choose an option"), buttons: [
                                .default(Text("Bookmark")),
                                .default(Text("Message the Organizer")),
                                .default(Text("More Details")),
                                .cancel()
                            ])
                        }
                    }
                    .padding(.trailing, 12).padding(.top, 6)
                }
                .padding()
            }
            .background(Color(hex: "#EAF2F4"))
            .cornerRadius(20)
            .padding() // This adds padding around the background color
        }
    }

    
    struct CalendarView_Previews: PreviewProvider {
        static var previews: some View {
            CalendarView()
        }
    }
}



