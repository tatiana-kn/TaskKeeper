//
//  TaskCardView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/23/24.
//

import SwiftUI

struct TaskCardView: View {
    var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.title)
                }
                .font(.title2)
                Text(task.description)
                    .lineLimit(2)
                Text("\(String(describing: task.project))")
            }
            Spacer()
            VStack {
                Label(task.trackedTime.formatted(), systemImage: "clock")
                Button("", systemImage: "play.fill", action: {})
                    .font(.largeTitle)
                    .padding(5)
            }
            
            
        }
        .foregroundColor(.black)
    }
}

#Preview {
    TaskCardView(task: Task.sampleTask[1])
//        .frame(width: 150, height: 150)
}
