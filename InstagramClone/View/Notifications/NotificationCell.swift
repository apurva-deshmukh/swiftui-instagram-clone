//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/22/23.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(viewModel.notification.username)
                .font(.system(size: 14, weight: .semibold)) +
            Text(viewModel.notification.type.notificationMessage)
                .font(.system(size: 15))
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                Image("post2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }

            }
        }
        .padding(.horizontal)
    }
}
