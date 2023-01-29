//
//  SearchView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 10/18/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            // grid view/user list view
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
