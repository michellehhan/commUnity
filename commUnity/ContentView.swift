//
//  CommunityProfileView.swift
//  commUnity
//
//  Created by Michelle Han on 10/20/23.
//

import Foundation
import SwiftUI

struct CommunityProfileView: View {
    @State private var currentPage: String = "communityProfile"
    func horizontalImageGallery() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<4, id: \.self) { index in
                    if index == 3 {  // Check if it's the last image
                        NavigationLink(destination: CalendarView()) {
                            Image("event\(index)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(8)
                                .opacity(0.75)
                        }
                    } else {
                        Image("event\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
        }
    }


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
                    HStack(spacing: 15) {
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Hello,")
                                    .font(.system(size:30))
                                Spacer()
                            }.padding(.top, 13)
                            
                            Text("Sarah Smith")
                                .font(.system(size:32))
                                .bold()
                            
                            HStack {
                                Image(systemName: "location")
                                Text("Granite Bay, CA")
                                    .font(.system(size:17))
                            }
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(9)
                            .background(Color(hex: "#84B3BF"))
                            .cornerRadius(10)
                        }
                        
                        // Profile Picture
                        Image("pfp_picnic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                    }
                    .padding(.leading, 20).padding(.trailing, 33)
                    
                    
                    VStack(spacing:16){
                        HStack {
                            Text("Upcoming Events")
                                .font(.system(size: 28))
                                .bold()
                            Image(systemName: "arrow.right").font(.system(size: 22)).scaleEffect(x: 1.3, y: 1)
                            Spacer()
                        }
                        horizontalImageGallery()  // Gallery for Upcoming Events

                        HStack {
                            Text("Recent News")
                                .font(.system(size: 28))
                                .bold()
                            Image(systemName: "arrow.right").font(.system(size: 22)).scaleEffect(x: 1.3, y: 1)
                            Spacer()
                        }
                        horizontalImageGallery()  // Gallery for Recent News
                    }
                    .padding(.top, 30)
                    .padding(.horizontal)


                }

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
                    
                    if currentPage != "communityProfile" {
                        NavigationLink(destination: ProfileView().onAppear {
                            self.currentPage = "communityProfile"
                        }) {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                                .clipShape(Circle())
                        }
                        .padding(.trailing) // padding on the side
                    } else {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(12).background( Color(hex: "#87C381").opacity(0.6))
                            .clipShape(Circle())
                        .padding(.trailing) // padding on the side
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
// padding on the side
                }
                
                .padding()
                .background(Color.gray.opacity(0.1))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                
                
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    struct CommunityProfileView_Previews: PreviewProvider {
        static var previews: some View {
            CommunityProfileView()
        }
    }
}

