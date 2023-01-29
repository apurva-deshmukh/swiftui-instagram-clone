//
//  CommentsView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/29/23.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    
    var body: some View {
        VStack {
            // comment list
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
        print("DEBUG: upload comment")
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
