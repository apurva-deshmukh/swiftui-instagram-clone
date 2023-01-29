//
//  UserListView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/21/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                }
            }
        }
    }
}
