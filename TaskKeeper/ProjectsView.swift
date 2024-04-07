//
//  ProjectView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct ProjectsView: View {
    var projects: [Project]
    
    var body: some View {
        List(projects) { project in
            ProjectCardView(project: project)
                .listRowBackground(project.theme?.mainColor)
        }
    }
}

#Preview {
    ProjectsView(projects: Project.sampleProject)
}
