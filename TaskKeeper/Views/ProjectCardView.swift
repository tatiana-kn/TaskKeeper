//
//  CardView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label(project.title, systemImage: project.icon ?? "paperclip.circle")
                    .font(.title2)
                Text(project.description ?? "")
                    .lineLimit(2)
                Text("\(project.taskList?.count ?? 0) task(s)")
            }
            Spacer()
            VStack {
                Label(project.trackedTime.formatted(), systemImage: "clock")
                Button("", systemImage: "play.fill", action: {})
                    .font(.largeTitle)
                    .padding(5)
            }
        }
        .foregroundColor(.black)
    }
}

#Preview {
    ProjectCardView(project: Project.sampleProject[2])
}
