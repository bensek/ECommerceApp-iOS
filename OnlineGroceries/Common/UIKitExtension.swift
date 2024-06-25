//
//  UIKitExtension.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 25/06/2024.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailTest.evaluate(with: self)
    }
}

