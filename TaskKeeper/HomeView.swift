//
//  HomeView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var multiSelection = Set<UUID>()
    
    var tasks: [Task]
    var projects: [Project]
    
    var body: some View {
        NavigationView {
            List(selection: $multiSelection) {
                ForEach(projects) { project in
                    Section(header: Text(project.title)) {
                        ForEach(project.taskList ?? []) { task in
                            Text(task.title)
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar { EditButton() }
        }
        Text("\(multiSelection.count) task(s)")
        
    }
}

#Preview {
    HomeView(tasks: Task.sampleTask, projects: Project.sampleProject)
}
