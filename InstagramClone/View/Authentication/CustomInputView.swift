//
//  CustomInputView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            // divider
            Divider()
            
            // hstack with send button and text field
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}
