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
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}

//    var tasks: [Task]
//    var projects: [Project]
//
//    var body: some View {
//        TabView {
//            HomeView(tasks: tasks, projects: projects)
//                .tabItem {
//                    Image(systemName: "house")
//                }
//            NewTaskView()
//                .tabItem {
//                    Image(systemName: "plus")
//                }
//            ProjectsView(projects: projects)
//                .tabItem {
//                    Image(systemName: "rectangle.stack")
//                }
//        }
//    }
