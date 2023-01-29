//
//  User.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/28/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var bio: String?
    var isFollowed: Bool? = false
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        return AuthenticationViewModel.shared.userSession?.uid == id
    }
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
