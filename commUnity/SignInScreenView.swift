import SwiftUI

struct SignInScreenView: View {
    @State private var email: String = ""
    @State private var navigateToHome = false

    var body: some View {
        ZStack {
            Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()

                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)

                    SocalLoginButton(image: Image("apple"), text: Text("Sign in with Apple"))

                    SocalLoginButton(image: Image("google"), text: Text("Sign in with Google"))
                        .padding(.vertical)
                    

                    Text("or get a link emailed to you")
                        .foregroundColor(Color.black.opacity(0.4))

                    TextField("Email address", text: $email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.vertical)

                    Button(action: {
                        navigateToHome = true
                    }) {
                        PrimaryButton(title: "Email me a signup link")
                    }
                    .background(
                        NavigationLink("", destination: CommunityProfileView().navigationBarHidden(true), isActive: $navigateToHome)
                    )
                }

                Spacer()
                Divider()
                Spacer()
                HStack {
                    Spacer() // Pushes the content to the center
                    Text("By signing up, you are agreeing to our ")
                    + Text("Terms & Conditions.")
                        .foregroundColor(Color(hex:"#87C381"))
                        .underline(true, color: Color(hex:"#87C381"))
                    Spacer()
                }
                .multilineTextAlignment(.center)


                Spacer()

            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}

struct SocalLoginButton: View {
    var image: Image
    var text: Text

    var body: some View {
        HStack {
            image
                .resizable()  // This makes the image resizable
                .scaledToFit()  // This scales the image to fit within its frame
                .frame(width: 30, height: 30)  // Set a specific size for the image
                .padding(.horizontal)
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
    }
}

