//
//  MainView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct MainView: View {
    var tasks: [Task]
    
    var body: some View {
        TabView {
            HomeView(tasks: tasks)
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
    MainView(tasks: Task.sampleTask)
}
