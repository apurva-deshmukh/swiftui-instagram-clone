//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage?, completion: FirestoreCompletion) {
        guard let user = AuthenticationViewModel.shared.currentUser else { return }
        guard let image else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = [
                "caption": caption,
                "timestamp": Timestamp(date: Date()),
                "likes": 0,
                "imageUrl": imageUrl,
                "ownerUid": user.id ?? "",
                "ownerImageUrl": user.profileImageUrl,
                "ownerUsername": user.username
            ] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
}

