//
//  MainTabView.swift
//  OnlineGroceries
//
//  Created by Ben Sekyondwa on 28/06/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        MainViewModel.shared.isUserLoggedIn = false
                    } label: {
                        Text("logout")
                    }
                }
            }
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
