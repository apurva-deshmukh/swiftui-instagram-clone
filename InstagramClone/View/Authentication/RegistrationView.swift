//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/28/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                if let postImage {
                    postImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding(.top, 44)
                } else {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                        ImagePicker(image: $selectedImage)
                    }
                    .padding()
                }

                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $userName, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.purple).opacity(0.3))
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }.padding(.bottom, 32)


            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
