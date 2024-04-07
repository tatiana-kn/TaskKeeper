//
//  MainView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct MainView: View {
    var tasks: [Task]
    var projects: [Project]
    
    var body: some View {
        TabView {
            HomeView(tasks: tasks, projects: projects)
                .tabItem {
                    Image(systemName: "house")
                }
            NewTaskView()
                .tabItem {
                    Image(systemName: "plus")
                }
            ProjectsView(projects: projects)
                .tabItem {
                    Image(systemName: "rectangle.stack")
                }
        }
    }
}

#Preview {
    MainView(tasks: Task.sampleTask, projects: Project.sampleProject)
}
