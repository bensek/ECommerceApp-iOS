//
//  MainViewModel.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 24/06/2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
   
    static var shared: MainViewModel = MainViewModel()

    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    @Published var isUserLoggedIn: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {
//        #if DEBUG
//        name = "Ben Sek"
//        email = "ben@gmail.com"
//        phone = "0790203997"
//        password = "password"
//        #endif
    }
    
    
    //MARK: ServiceCall
    func serviceCallLogin() {
        if (!email.isValidEmail) {
            self.showError = true
            self.errorMessage = "Please enter valid email address"
            
            return
        }
        
        if (password.isEmpty) {
            self.showError = true
            self.errorMessage = "Please enter valid password"
        
            return
        }
    
        ServiceCall.post(parameter: ["email": $email, "password": $password], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.message) as? String ?? "" == "User Logged In Successfully" {
                    print(response)
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                } else {
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                }
            }
        } failure: { error in
            
            self.showError = true
            //self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
            
        }

    }
    
    func serviceCallRegister() {
        if (name.isEmpty) {
            self.showError = true
            self.errorMessage = "Please enter your full name"
        
            return
        }
        if (!email.isValidEmail) {
            self.showError = true
            self.errorMessage = "Please enter valid email address"
            
            return
        }
        
        if (phone.isEmpty) {
            self.showError = true
            self.errorMessage = "Please enter your phone number"
        
            return
        }
        
        if (password.isEmpty) {
            self.showError = true
            self.errorMessage = "Please enter valid password"
        
            return
        }
    
        ServiceCall.post(parameter: ["name": $name, "email": $email, "phone": $phone, "password": $password], path: Globs.SV_REGISTER) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.message) as? String ?? "" == "User Registered In Successfully" {
                    print(response)
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                } else {
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                }
            }
        } failure: { error in
            
            self.showError = true
            //self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
            
        }

    }
}



