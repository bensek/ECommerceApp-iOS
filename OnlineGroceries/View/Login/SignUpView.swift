//
//  SignUpView.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 25/06/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;

    var body: some View {
        ZStack {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView {
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(.bottom, 4)
                    
                    Spacer()
                        .frame(height: .screenWidth * 0.15)
                    
                    Text("Log In")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your email and password")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Full Name", placeholder: "Enter your full name", text: $mainVM.name, keyboardType: .default)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Email", placeholder: "Enter your email address", text: $mainVM.email, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Phone", placeholder: "Enter your phone number", text: $mainVM.phone, keyboardType: .default)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField(title: "Password", placeholder: "Enter your password", text: $mainVM.password, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    VStack(alignment: .leading) {
                        Text("By continuing you agree to our")
                            .font(.customfont(.medium, fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                           
                            
                            Text("Terms of Service")
                                .font(.customfont(.medium, fontSize: 16))
                                .foregroundColor(.primaryApp)
                            
                            Text(" and ")
                                .font(.customfont(.medium, fontSize: 16))
                                .foregroundColor(.secondaryText)
                            
                            Text("Privacy Policy")
                                .font(.customfont(.medium, fontSize: 16))
                                .foregroundColor(.primaryApp)
                               
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    RoundButton(title: "Sign Up") {
                        mainVM.serviceCallRegister()
                        
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
//                    NavigationLink {
//                        LoginView()
//                    } label: {
//                        HStack {
//                            Text("Already have an account?")
//                                .font(.customfont(.semibold, fontSize: 14))
//                                .foregroundColor(.primaryText)
//
//                            Text("Signin")
//                                .font(.customfont(.semibold, fontSize: 14))
//                                .foregroundColor(.primaryApp)
//                        }
//                    }
                    
//                    Spacer()
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            
            }
            
            VStack {
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage), dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
