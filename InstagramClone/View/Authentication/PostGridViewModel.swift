//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(for: config)
    }
    
    func fetchPosts(for config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchAllPosts()
        case .profile(let uid):
            fetchUserPosts(for: uid)
        }
    }
    
    func fetchAllPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _  in
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    func fetchUserPosts(for uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    
}
