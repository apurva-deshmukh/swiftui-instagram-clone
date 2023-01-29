//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject private var viewModel: EditProfileViewModel
    @State private var bioText = ""
    @Environment(\.presentationMode) var mode
    
    init(viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    viewModel.saveUserData(bio: bioText)
                } label: {
                    Text("Done")
                        .bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: 370, height: 200)
                .padding()
            
            
            Spacer()
        }.onReceive(viewModel.$uploadComplete) { didComplete in
            if didComplete {
                self.mode.wrappedValue.dismiss()
            }
        }
    }
}
