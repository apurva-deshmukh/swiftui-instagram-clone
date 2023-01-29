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
        }
    }
    
    func register(email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
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
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        print("DEBUG: reset password")
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            print(snapshot?.data())
        }
    }
}
