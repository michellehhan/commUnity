

// 10/19/24

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "#87C381"))
            .cornerRadius(50)
    }
}

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("logo").resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Spacer()
                    Text("WELCOME TO").font(.system(size: 21)).fontWeight(.semibold).padding(.bottom, 0.5)
                    Text("commUnity").font(.system(size: 55)).fontWeight(.bold).padding(.bottom, 90)
                    NavigationLink(
                        destination: SignInScreenView().navigationBarHidden(true),
                        label: {
                            PrimaryButton(title: "Get Started")
                        })
                    
                    HStack {
                        Text("Already have an account? ")
                        NavigationLink(
                            destination: SignInScreenView().navigationBarHidden(true),
                            label: {
                                Text("Sign In").bold()
                                    .foregroundColor(Color(hex: "#87C381"))
                            })
                    }.padding(.top, 25)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
