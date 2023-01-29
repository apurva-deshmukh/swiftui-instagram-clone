//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 10/18/22.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthenticationViewModel.shared)
        }
    }
}
