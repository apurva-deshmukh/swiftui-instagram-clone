//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            self.notification.isFollowed = true
            NotificationsViewModel.uploadNotification(to: self.notification.uid, type: .follow)
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        
    }
}
