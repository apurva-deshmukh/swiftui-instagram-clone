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
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            print("Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        print("DEBUG: unfollow")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
