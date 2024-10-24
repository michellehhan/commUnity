//
//  MessageView.swift
//  commUnity
//
//  10/19/24
//

import Foundation
import SwiftUI

struct ChatMessage {
    let content: String
    let isFromCurrentUser: Bool
}

struct MessageView: View {
    @State private var currentPage: String = "message"
    @State private var messages: [ChatMessage] = [
        ChatMessage(content: "Hi David, I’m very interested in attending the Green Harmony Summit, and would love to help out! Do you need any volunteers?", isFromCurrentUser: true),
        ChatMessage(content: "Hello Sarah! Yes, we are looking help, especially with the workshops and event logistics.", isFromCurrentUser: false),
        ChatMessage(content: "Great! I'd love to assist with the workshops. Anything specific you need help with?", isFromCurrentUser: true),
        ChatMessage(content: "That's awesome, Steven! We could use help with coordinating workshop materials and guiding attendees. I'll send over some details soon.", isFromCurrentUser: false)
    ]

    @State private var currentMessage: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Top Navigation Bar
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
                            .frame(width: 30, height: 30).padding(20)
                            .foregroundColor(Color.white)
                    }
                    .padding(.top,50)
                    .padding(.trailing,10)
                }
                .padding(.horizontal).padding(.bottom, 20)
                
                // Profile images and names
                HStack {
                    Image("david")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Text("David Andrews")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Text("You")
                        .font(.title2)
                        .bold()
                    
                    Image("pfp_picnic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .padding(.horizontal).padding(.bottom, 17)
                
                
                // Chat messages
                ScrollView {
                    VStack(spacing: 22) {
                        ForEach(messages, id: \.content) { message in
                            HStack {
                                if message.isFromCurrentUser {
                                    Spacer()
                                    Text(message.content)
                                        .font(.system(size: 14))  // Smaller font
                                        .padding(9)  // Reduced padding
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.trailing, 10).padding(.leading, 15)  // Padding to prevent touching the end
                                } else {
                                    Image("david")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)  // Increased size
                                        .clipShape(Circle()).padding(.leading, 10)
                                    Text(message.content)
                                        .font(.system(size: 14))  // Smaller font
                                        .padding(9)  // Reduced padding
                                        .background(Color.gray.opacity(0.2))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                        .padding(.leading, 10).padding(.trailing, 15)  // Padding to prevent touching the end
                                }
                            }
                        }
                    }
                }

                
                // Text input and send button
                HStack {
                    TextField("Type a message...", text: $currentMessage)
                        .padding(.leading, 5).padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.leading, 15)

                    Button(action: {
                        if !currentMessage.isEmpty {
                            let newMessage = ChatMessage(content: currentMessage, isFromCurrentUser: true)
                            messages.append(newMessage)
                            currentMessage = ""
                        }
                    }) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 20).padding(.leading, 8)
                    }
                }
                .padding(.bottom,3)
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
                    
                    if currentPage != "message" {
                        NavigationLink(destination: MessageView().navigationBarBackButtonHidden(true).onAppear {
                            self.currentPage = "message"
                        }) {
                            Image(systemName: "message")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(12).background(Color(hex: "#87C381").opacity(0.6))
                                .clipShape(Circle())
                        }
                    } else {
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(12).background(Color(hex: "#87C381").opacity(0.6))
                            .clipShape(Circle())
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
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
