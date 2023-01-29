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
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
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
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
                        .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
}
