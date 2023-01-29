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
    
    var timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
