//
//  ContentView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 10/18/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView().environmentObject(viewModel)
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
