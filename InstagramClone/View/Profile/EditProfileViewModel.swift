//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    private let user: User
    @Published var uploadComplete = false
    init(user: User) {
        self.user = user
    }
    
    func saveUserData(bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.uploadComplete = true
        }
    }
}
