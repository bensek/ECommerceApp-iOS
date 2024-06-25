//
//  MainViewModel.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 24/06/2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
   
    static var shared: MainViewModel = MainViewModel()

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {
        #if DEBUG
        email = "ben@gmail.com"
        password = "password"
        #endif
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
}



