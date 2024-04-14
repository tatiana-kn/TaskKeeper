//
//  NewTaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct NewTaskView: View {
    @StateObject var viewModel = NewTaskViewViewModel()
    @Binding var isNewTaskPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.title)
                .bold()
                .padding(.top, 40)
            Form {
                TextField("Add task title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: [.date])
                
                TKButton(title: "Save", background: .blue) {
                    if viewModel.canSave {
                        viewModel.save()
                        isNewTaskPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date"))
            }
        }
    }
}

#Preview {
    NewTaskView(isNewTaskPresented: .constant(true))
}

//    @State private var taskTitle = ""
//    @State private var taskDescription = ""
//    @State private var priority = "Medium"
//    @State private var project = "none"
//    @State private var date = Date()
//    @State private var isDateSelected: Bool = false
//
//
//    let priorities = ["Low", "Medium", "High"]
//    let projects = ["none","Project1", "Project2", "Project3"]
//
//    var body: some View {
//
//        VStack {
//            Text("New Task")
//                .font(.title)
//
//        VStack(alignment: .leading) {
//            Text("Title")
//                .font(.headline)
//            TextField("Add task title", text: $taskTitle)
//                .textFieldStyle(.roundedBorder)
//            Spacer()
//
//            Text("Description")
//                .font(.headline)
//            TextField("Add task description", text: $taskDescription, axis: .vertical)
//                .lineLimit(4, reservesSpace: true)
//                .textFieldStyle(.roundedBorder)
//            Spacer()
//
//            DatePicker(
//                "Due Date",
//                selection: $date,
//                in: Date()...,
//                displayedComponents: [.date]
//            )
//            .font(.headline)
//            .onChange(of: date, initial: false, { _, newValue in
//                isDateSelected = true
//            })
//
//            Spacer()
//
//            Text("Estimate Time")
//                .font(.headline)
//            Spacer()
//
//            Text("Priority")
//                .font(.headline)
//            Picker("Priority", selection: $priority) {
//                ForEach(priorities, id: \.self) {
//                    Text($0)
//                }
//            }
//            .pickerStyle(.segmented)
//            Spacer()
//
//
//            Text("Project")
//                .font(.headline)
//            Form {
//                Picker("Project", selection: $project) {
//                    ForEach(projects, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
////            .pickerStyle(.navigationLink) // добавить  navigation stack
//            Spacer()
//        }
//
//        Button("CREATE TASK", action: {})
//            .frame(width: 250, height: 50)
//            .background(Theme.lilac.mainColor)
//            .clipShape(.rect(cornerRadius: 15))
//            .foregroundColor(.black)
//    }
//        .padding()
//    }
