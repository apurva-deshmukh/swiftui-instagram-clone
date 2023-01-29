//
//  Post.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let ownerImageUrl: String
    let ownerUsername: String
    let timestamp: Timestamp
    
    var didLike: Bool? = false
}
