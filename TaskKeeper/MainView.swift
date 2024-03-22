//
//  MainView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            NewTaskView()
                .tabItem {
                    Image(systemName: "plus")
                }
            ProjectsView()
                .tabItem {
                    Image(systemName: "rectangle.stack")
                }
        }
    }
}

#Preview {
    MainView()
}
