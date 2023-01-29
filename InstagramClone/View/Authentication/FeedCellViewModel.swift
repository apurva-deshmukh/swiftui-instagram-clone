//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    var likeString: String {
        return "\(post.likes) like\(post.likes != 1 ? "s" : "")"
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    func like() {
        guard let currentUserId = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId)
            .collection("post-likes").document(currentUserId).setData([:]) { _ in
                COLLECTION_USERS.document(currentUserId)
                    .collection("user-likes").document(postId).setData([:]) { _ in
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1]) { _ in
                            self.post.didLike = true
                            self.post.likes += 1
                            
                            NotificationsViewModel.uploadNotification(to: self.post.ownerUid, type: .like, post: self.post)
                        }
                    }
            }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let currentUserId = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId)
            .collection("post-likes").document(currentUserId).delete { _ in
                COLLECTION_USERS.document(currentUserId)
                    .collection("user-likes").document(postId).delete { _ in
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1]) { _ in
                            self.post.didLike = false
                            self.post.likes -= 1
                        }
                    }
            }
    }
    
    func checkIfUserLikedPost() {
        guard let currentUserId = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(currentUserId)
            .collection("user-likes").document(postId).getDocument { snapshot, _ in
                guard let didLike = snapshot?.exists else { return }
                self.post.didLike = didLike
            }
    }
}
