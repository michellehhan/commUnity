// 10/19/24
import SwiftUI

struct SignInScreenView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToHome: Bool = false

    var body: some View {
        NavigationView{
            ZStack {
                Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: CommunityProfileView().navigationBarHidden(true), isActive: $navigateToHome) {
                            EmptyView()
                        }
                        Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                        
                        SocalLoginButton(image: Image("apple"), text: Text("Sign in with Apple"), action: {
                            navigateToHome = true
                        })
                        
                        SocalLoginButton(image: Image("google"), text: Text("Sign in with Google"), action: {
                            navigateToHome = true
                        })
                        
                        .padding(.vertical)
                        
                        Text("or create an account")
                            .foregroundColor(Color.black.opacity(0.5))
                            .padding(.bottom, 10)
                        
                        HStack {
                            TextField("First Name", text: $firstName)
                                .font(.title3)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(25.0)
                                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0.0, y: 8)
                            
                            TextField("Last Name", text: $lastName)
                                .font(.title3)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(25.0)
                                .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0.0, y: 8)
                        }
                        
                        TextField("Email", text: $email)
                            .onChange(of: email) { newValue in
                                email = newValue.lowercased()
                            }
                            .font(.title3)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25.0)
                            .shadow(color: Color.black.opacity(0.09), radius: 30, x: 0.0, y: 8)
                            .padding(.vertical, 5)

                        
                        SecureField("Password", text: $password)
                            .font(.title3)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25.0)
                            .shadow(color: Color.black.opacity(0.09), radius: 30, x: 0.0, y: 8)
                            .padding(.vertical, 5)
                        
                        Button(action: {
                            navigateToHome = true
                        }) {
                            PrimaryButton(title: "Create Account")
                        }
                    }
                    
                    Spacer()
                    Divider()
                    Spacer()
                    HStack {
                        Spacer() // Pushes the content to the center
                        Text("By signing up, you are agreeing to our ")
                        + Text("Terms & Conditions.")
                            .foregroundColor(Color(hex:"#87C381")).fontWeight(.semibold)
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
}


struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}

struct SocalLoginButton: View {
    var image: Image
    var text: Text
    var action: () -> Void = {}  // Default value

    var body: some View {
        Button(action: action) {
            HStack {
                image
                    .resizable()  // This makes the image resizable
                    .scaledToFit()  // This scales the image to fit within its frame
                    .frame(width: 32, height: 32)
                    .padding(.leading, 20)
                Spacer()
                text
                    .font(.title2)
                    .foregroundColor(Color.black).padding(.trailing, 20)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(50.0)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
        }
    }
}






