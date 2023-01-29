//
//  Notification.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import FirebaseFirestoreSwift
import Firebase

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like:
            return " liked one of your posts."
        case .comment:
            return " commented on one of your posts."
        case .follow:
            return " started following you."
        }
    }
}

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
}
