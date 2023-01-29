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
    
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool {
        return AuthenticationViewModel.shared.userSession?.uid == id
    }
}
