//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 10/18/22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    @ObservedObject var viewModel = UploadPostViewModel()
    
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption...", text: $captionText)
                }
                .padding()
                
                Button {
                    viewModel.uploadPost(caption: captionText, image: selectedImage) { _ in
                        captionText = ""
                        postImage = nil
                        tabIndex = 0
                    }
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()

            }
            Spacer()
        }

    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
