//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/28/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        print("DEBUG: follow")
    }
    
    func unfollow() {
        print("DEBUG: unfollow")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
