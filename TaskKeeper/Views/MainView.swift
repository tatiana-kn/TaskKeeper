//
//  MainView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TaskListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            TagsView(userId: viewModel.currentUserId, tag: tagList.family)
                .tabItem {
                    Label("Tags", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.minty)
    }
}

#Preview {
    MainView()
}

