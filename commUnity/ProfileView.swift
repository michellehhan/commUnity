//
//  ProfileView.swift
//  commUnity
//
//  Created by Michelle Han on 10/20/23.
//

import Foundation
import SwiftUI

struct Event1: Identifiable {
    var id = UUID()
    var activityImage: String
    var activityTitle: String
    var activityDate: String
    var activityDistance: String
    var activityDescription: String
    var likes: Int
    var comments: Int
}

struct NotificationsOverlay: View {
    var notifications: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(notifications, id: \.self) { notification in
                HStack {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.gray)
                    Text(notification)
                }
                .padding(.horizontal)
                Divider()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CombinedActivityAndProfile1: View {
    var activityImage: String
    var activityTitle: String
    var activityDate: String
    var activityDistance: String
    var activityDescription: String
    var profileImage: String
    var profileUserName: String
    var profileLikes: Int
    var profileComments: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(activityImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(10).padding(.bottom, 8)
            
            Text(activityTitle)
                .font(.system(size: 22)).fontWeight(.medium).padding(.bottom, 3).padding(.top,3)
            
            HStack {
                // Calendar and date
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.white)
                    Text(activityDate)
                        .font(.system(size: 14))
                        .foregroundColor(.white).fontWeight(.heavy)
                }
                .padding(6)
                .background(Color(hex: "#84B3BF"))
                .cornerRadius(10)
                
                Spacer() // This will push the distance to the right
                
                // Location pin and distance
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.white)
                    Text(activityDistance)
                        .font(.system(size: 14))
                        .foregroundColor(.white).fontWeight(.heavy)
                }
                .padding(6)
                .background(Color(hex: "#84B3BF"))
                .cornerRadius(10)
            }
            
            Text(activityDescription)
                .font(.system(size: 15))
                .foregroundColor(.black)
                .padding(.top, 4)
            
            HStack(spacing: 10) {
                // Profile Picture
                Image(profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle()).padding(.leading, -8)
                
                // Name
                Text(profileUserName)
                    .font(.system(size: 17, weight: .medium))
                
                Spacer()
                
                // Likes
                HStack(spacing: 5) {
                    Image(systemName: "hand.thumbsup")
                        .foregroundColor(.black)
                    Text("\(profileLikes)")
                        .font(.system(size: 17))
                }.padding(.horizontal,7)
                
                // Comments
                HStack(spacing: 5) {
                    Image(systemName: "text.bubble")
                        .foregroundColor(.black)
                    Text("\(profileComments)")
                        .font(.system(size: 17))
                }
            }
            .padding(.horizontal, 10)
        }
    }
}


struct ProfileView: View {
    @State private var currentPage: String = "profile"
    @State private var showNotifications = false
    
    @State private var events: [Event1] = [
        Event1(activityImage: "protest",
               activityTitle: "Roseville Green Summit 2023",
               activityDate: "OCT 15, 9AM - 5PM",
               activityDistance: "2.4 Miles",
               activityDescription: "Unite for change at the Green Harmony Summit: where passion meets action for a sustainable tomorrow.",
               likes: 71,
               comments: 21),
        Event1(activityImage: "read",
               activityTitle: "Rallying For Reading Rights @ Granite Bay High School",
               activityDate: "OCT 17, 3PM - 5PM",
               activityDistance: "3.1 Miles",
               activityDescription: "Join us in opposing censorship and book bans. Prominent voices will deliver speeches, sharing their insights and experiences.",
               likes: 41,
               comments: 11)
    ]
    
    let sampleNotifications = [
        "4 days until Roseville Green Summit 2023!",
        "Time changed for Rallying for Reading Rights",
        "New message from David Andrews"
    ]
    
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack(spacing: 16) {
                    
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
                                .frame(width: 50, height: 50)

                            // Then the Image
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.white).padding(15)
                                .onTapGesture {
                                    showNotifications.toggle()
                                }
                        }

                        .padding(.top, 50)
                        .padding(.trailing, 10)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            Image("header")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding(.horizontal,4)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Image("pfp_picnic")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 95, height: 95)
                                        .clipShape(Circle())
                                        .background(Circle().stroke(Color.white, lineWidth: 12))
                                        .padding(.top, -20)
                                        .padding(.horizontal)
                                        .background(Circle().stroke(Color.white, lineWidth: 12))
                                        .padding(.top, -40)
                                        .padding(.horizontal)
                                    
                                    Text("Sarah Smith")
                                        .font(.system(size: 23))
                                        .bold()
                                        .padding(.horizontal,25)
                                        .padding(.top, 10)
                                    
                                    Text("🌱 Championing eco-initiatives | Organizer of Green Harmony Summit | Building bridges for a sustainable future 🌍")
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 16))
                                        .padding(.horizontal, 25)
                                        .padding(.top,1)
                                }
                                
                                Spacer()
                            }
                            
                            Divider()
                                .padding(.vertical)
                            
                            Text("My Activity")
                                .font(.system(size: 25))
                                .bold()
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 8)
                            
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(events) { event in
                                    VStack {
                                        CombinedActivityAndProfile1(
                                            activityImage: event.activityImage,
                                            activityTitle: event.activityTitle,
                                            activityDate: event.activityDate,
                                            activityDistance: event.activityDistance,
                                            activityDescription: event.activityDescription,
                                            profileImage: "pfp_picnic",
                                            profileUserName: "Sarah Smith",
                                            profileLikes: event.likes,
                                            profileComments: event.comments
                                        )
                                        .padding()
                                    }
                                    .background(Color(hex: "#EAF2F4"))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                                .padding(.bottom, 30)
                            }
                        }
                    }
                    // Bottom Navigation Bar
                    HStack {
                        NavigationLink(destination: CalendarView().navigationBarBackButtonHidden(true).onAppear {
                            self.currentPage = "calendar"
                        }) {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .padding(.leading) // padding on the side
                        
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
                        
                        NavigationLink(destination: NewsView().navigationBarBackButtonHidden(true).onAppear {
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
                        
                        if currentPage != "profile" {
                            NavigationLink(destination: ProfileView().onAppear {
                                self.currentPage = "profile"
                            }) {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                                    .clipShape(Circle())
                            }
                            .padding(.trailing) // padding on the side
                        } else {
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                    
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            }
            if showNotifications {
                VStack {
                    Spacer(minLength: 0)
                    HStack {
                        Spacer()
                        NotificationsOverlay(notifications: sampleNotifications)
                            .padding(.trailing, 100).padding(.top, 70)
                    }
                }
            }
        }
        .onTapGesture {
            if showNotifications {
                showNotifications = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}




