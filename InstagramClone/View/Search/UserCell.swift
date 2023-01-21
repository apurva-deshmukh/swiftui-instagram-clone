//
//  UserCell.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/21/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("post2")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("joker")
                    .font(.system(size: 14, weight: .semibold))
                Text("Heath Ledger")
                    .font(.system(size: 14))
            }
            Spacer()
        }
       
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
