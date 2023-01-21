//
//  SearchView.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 10/18/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText)
                .padding()
            
            // grid view/user list view
            //PostGridView()
            UserListView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
