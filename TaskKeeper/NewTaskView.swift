//
//  NewTaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct NewTaskView: View {
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var priority = "Medium"
    @State private var project = "none"
    @State private var date = Date()
    
    let priorities = ["Low", "Medium", "High"]
    let projects = ["none","Project1", "Project2", "Project3"]
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.title)
            
            Text("Title")
            TextField("Add task title", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            Text("Description")
            TextField("Add task description", text: $taskDescription)
                .textFieldStyle(.roundedBorder)
            Text("Due Date")
//            DatePicker("Due Date", selection: <#T##Binding<Date>#>)
            Text("Estimate Time")
            
            Text("Priority")
            Picker("Priority", selection: $priority) {
                ForEach(priorities, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            
            Text("Project")
            Picker("Project", selection: $project) {
                ForEach(projects, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.navigationLink)
            
            Button("CREATE TASK", action: {})
            
        }
        .padding()
    }
}

#Preview {
    NewTaskView()
}
