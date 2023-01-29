//
//  NotificationsViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotifications() {
        
    }
    
    static func uploadNotification(to uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthenticationViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "uid": user.id ?? "",
            "profileImageUrl": user.profileImageUrl,
            "type": type.rawValue
        ]
        
        if let post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
