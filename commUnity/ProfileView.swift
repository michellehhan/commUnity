//
//  ProfileView.swift
//  commUnity
//
//  Created by Michelle Han on 10/20/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var currentPage: String = "profile"
    
    var body: some View {
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
                        
                        Text("Activity")
                            .font(.system(size: 22))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            ActivityRow(
                                image: "protest",
                                title: "Roseville Green Summit 2023",
                                date: "OCT 15, 9AM - 5PM",
                                distance: "2.4 MILES",
                                description: "Unite for change at the Green Harmony Summit: where passion meets action for a sustainable tomorrow.")
                            ProfileInfoView(
                                profileImage: "pfp_picnic",
                                userName: "Sarah Smith",
                                likes: 12,
                                comments: 7
                            )
                            
                        }
                        .padding(.horizontal)
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
                        .padding(.trailing) // padding on the side
                    } // padding on the side
                }
                
                .padding()
                .background(Color.gray.opacity(0.1))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ActivityRow: View {
        var image: String
        var title: String
        var date: String
        var distance: String
        var description: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(title)
                    .font(.system(size: 19)).padding(.bottom, 3).padding(.top,3)
                HStack {
                    // Calendar and date
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                        Text(date)
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    Spacer() // This will push the distance to the right
                    
                    // Location pin and distance
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.black)
                        Text(distance)
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                
                
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.top, 4)
            }
        }
    }
    
    struct ProfileInfoView: View {
        var profileImage: String
        var userName: String
        var likes: Int
        var comments: Int
        
        var body: some View {
            HStack(spacing: 10) {
                // Profile Picture
                Image(profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                // Name
                Text(userName)
                    .font(.system(size: 15, weight: .medium))
                
                Spacer()
                
                // Likes
                HStack(spacing: 5) {
                    Image(systemName: "hand.thumbsup")
                        .foregroundColor(.gray)
                    Text("\(likes)")
                        .font(.system(size: 13))
                }.padding(.horizontal,7)
                
                // Comments
                HStack(spacing: 5) {
                    Image(systemName: "text.bubble")
                        .foregroundColor(.gray)
                    Text("\(comments)")
                        .font(.system(size: 13))
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}

struct MyCustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                Text("Back")
            }
        }
    }
}
