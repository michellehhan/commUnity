



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
                    Image("logo")
                    Spacer()
                    
                    NavigationLink(
                        destination: SignInScreenView().navigationBarHidden(true),
                        label: {
                            PrimaryButton(title: "Get Started")
                        })
                    
                    HStack {
                        Text("New around here? ")
                        NavigationLink(
                            destination: SignInScreenView().navigationBarHidden(true),
                            label: {
                                Text("Sign Up").bold()
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
