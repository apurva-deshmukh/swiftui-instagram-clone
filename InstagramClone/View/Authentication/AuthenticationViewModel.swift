//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/28/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AuthenticationViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink: Bool = false
    
    static let shared = AuthenticationViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: LOGIN FAILED \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image else { return }
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                
                guard let user = result?.user else { return }
                let data = [
                    "email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid
                ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("DEBUG: uploaded user data")
                    self?.userSession = user
                    self?.fetchUser()
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        
        try? Auth.auth().signOut()
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error {
                print("Failed to send link with error \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
