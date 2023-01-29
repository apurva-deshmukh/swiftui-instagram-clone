//
//  CommentsView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0 ..< 10) { _ in
                        CommentCell()
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}
