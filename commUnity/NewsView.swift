//
//  NewsView.swift
//  commUnity
//
//  10/19/24
//

import Foundation
import SwiftUI

struct GuardianResponse: Decodable {
    let response: GuardianNewsData
}

struct GuardianNewsData: Decodable {
    let results: [NewsArticle]
}

struct NewsArticle: Identifiable, Decodable {
    let id: String
    let webTitle: String
    let webUrl: URL
    let fields: ArticleFields?

    struct ArticleFields: Decodable {
        let thumbnail: URL?
        let trailText: String?
    }
}

struct NewsView: View {
    @State private var currentPage: String = "news"
    @State private var newsArticles: [NewsArticle] = []
    
    @State private var showNotifications = false
    let sampleNotifications = [
        "4 days until Wildfire Relief Fundraiser!",
        "Time changed for Inflation 101 Event",
        "New message from David Andrews"
    ]
    
    let categories = ["All", "Politics", "Business", "Technology", "Entertainment", "Sports"]
    @State private var selectedCategory = "All"
    
    private func fetchNews() {
        let baseApiUrl = "https://content.guardianapis.com/"
        let apiKeyParam = "show-fields=thumbnail,trailText&api-key=be1682f5-0b5b-4ee4-9b4a-317a66279a99"
        var endpoint = "us-news"
        
        // Adjust the endpoint based on the selected category
        if selectedCategory != "All" {
            endpoint = selectedCategory.lowercased()
        }
        
        let apiUrl = "\(baseApiUrl)\(endpoint)?\(apiKeyParam)"
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    let decodedData = try JSONDecoder().decode(GuardianResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.newsArticles = decodedData.response.results
                    }
                } catch {
                    print("Failed to decode the news data:", error)
                }
            } else {
                print("API call failed with error:", error ?? "Unknown error")
            }
        }.resume()
    }
    
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 16) {
                    HStack {
                        ZStack {
                            Color(hex: "#FFFFFF")
                                .cornerRadius(15)
                                .frame(width: 50, height: 50)
                            
                        }
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
                            
                        }.padding(.bottom, 5)
                        
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
                                .foregroundColor(Color.white).padding(17)
                                .onTapGesture {
                                    showNotifications.toggle()
                                }
                        }.padding(.bottom, 6)
                            .padding(.trailing, 15)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        Text("Discover")
                            .font(.system(size:30))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25)
                        Text("The latest news updates")
                            .font(.system(size:15))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25).padding(.bottom, 15)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(categories, id: \.self) { category in
                                    Text(category)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 5)
                                        .background(selectedCategory == category ? Color(hex: "#BCE4EB") : Color(hex: "#EAF2F4"))
                                        .cornerRadius(12)
                                        .onTapGesture {
                                            selectedCategory = category
                                            fetchNews()
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        ForEach(newsArticles) { article in
                            HStack(spacing: 12) {
                                // Image section
                                if let imageUrl = article.fields?.thumbnail, let imageData = try? Data(contentsOf: imageUrl), let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(width: 130, height: 88)
                                        .cornerRadius(7)
                                }
                                
                                // Headline and description section
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(article.webTitle)
                                        .font(.system(size:15)).bold()
                                    if let description = article.fields?.trailText {
                                        Text(description.prefix(60) + "...")
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                    }
                                    Link(destination: article.webUrl) {
                                        Text("Read more...")
                                            .font(.system(size: 14))
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            .padding()
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
                        
                        if currentPage != "news" {
                            NavigationLink(destination: NewsView().navigationBarBackButtonHidden(true).onAppear {
                                self.currentPage = "news"
                            }) {
                                Image(systemName: "newspaper")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(12).background(Color(hex: "#87C381").opacity(0.6))
                                    .clipShape(Circle())
                            }
                        } else {
                            Image(systemName: "newspaper")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(12).background(Color(hex: "#87C381").opacity(0.6))
                                .clipShape(Circle())
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
                    .padding().padding(.bottom, -35)
                    .background(Color.gray.opacity(0.1))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                }.opacity(showNotifications ? 0.4 : 1)
                    .onAppear(perform: fetchNews)
            }
                if showNotifications {
                    VStack {
                        Spacer(minLength: 0)
                        HStack {
                            Spacer()
                            NotificationsOverlay(notifications: sampleNotifications)
                                .padding(.trailing, 100).padding(.top, 70)
                        } // End of notifications HStack
                    } // End of notifications VStack
                }
            }
        }
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
