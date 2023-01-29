//
//  Comment.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let postOwnerUid: String
    let commentText: String
    let uid: String
}
