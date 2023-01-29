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
    }
    
    func like() {
        print("DEBUG: like")
    }
    
    func unlike() {
        print("DEBUG: unlike")
    }
    
    func checkIfUserLikedPost() {
        
    }
}
