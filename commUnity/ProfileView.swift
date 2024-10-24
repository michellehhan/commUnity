//
//  ProfileView.swift
//  commUnity
//
// 10/19/24
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
        Event1(activityImage: "wildfire",
               activityTitle: "Wildfire Relief Fundraiser Event",
               activityDate: "NOV 4, 9AM - 12PM",
               activityDistance: "2.4 Miles",
               activityDescription: "Engage in workshops, learn from fire experts, and donate to our fundraiser. Every contribution supports community education, wildfire initiatives, and aids affected families.",
               likes: 71,
               comments: 21),
        Event1(activityImage: "inflation",
               activityTitle: "Inflation 101: Empowering Our Community",
               activityDate: "NOV 12, 3PM - 5PM",
               activityDistance: "3.1 Miles",
               activityDescription: "Join workshops & expert-led sessions tailored to help our community navigate inflation challenges. Your involvement strengthens community financial literacy, ensuring resilience in any economy!",
               likes: 41,
               comments: 11)
    ]
    
    let sampleNotifications = [
        "4 days until Wildfire Relief Fundraiser!",
        "Time changed for Inflation 101 Event",
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
                                .foregroundColor(Color.white).padding(20)
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
                                    
                                    Text("🔥 Wildfire relief advocate & community builder | Empowering through education 📚 | United for resilience 🌲✨")
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
            }.opacity(showNotifications ? 0.4 : 1)
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




