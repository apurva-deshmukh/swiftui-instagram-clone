//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Done")
                        .bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: 370, height: 200)
                .padding()
            
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
