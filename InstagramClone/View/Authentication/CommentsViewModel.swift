//
//  CommentsViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthenticationViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = [
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "uid": user.id ?? "",
            "timestamp": Timestamp(date: Date()),
            "postOwnerUid": post.ownerUid,
            "commentText": commentText
        ]
        
        COLLECTION_POSTS.document(postId)
            .collection("post-comments").addDocument(data: data)
    }
    
    func fetchComments() {
        
    }
}
