//
//  OnlineGroceriesApp.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 24/06/2024.
//

import SwiftUI

@main
struct OnlineGroceriesApp: App {
    @StateObject var mainVM = MainViewModel.shared
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVM.isUserLoggedIn {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
