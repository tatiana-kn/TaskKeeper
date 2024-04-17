//
//  TaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/17/24.
//

import SwiftUI

struct TaskView: View {

    @StateObject var viewModel = TaskViewViewModel()
    @State var taskId: String

    var body: some View {
        VStack {
            Form {
                Text(taskId)
                TextField("Task title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Tag", text: $viewModel.tag)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: [.date])
                
                HStack {
                    Text("Set High Priority")
                    Spacer()
                    
                    Text(viewModel.isHighPriority ? "!" : "")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.redish)
                    
                    Button {
                        viewModel.isHighPriority.toggle()
                    } label: {
                        Image(systemName: viewModel.isHighPriority ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                            .foregroundStyle(viewModel.isHighPriority ? .redish : .minty)
                    }
                }
                
                TKButton(title: "Save", background: .minty) {
                    if viewModel.canSave {
                        viewModel.update(itemId: taskId)
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadTask(taskId: taskId)
        }

    }
}

//#Preview {
//    TaskView(action: {})
//}

//     @Binding var task: TaskItem
//    @Binding var title: String
//    @Binding var tag: String
//    @Binding var dueDate: Date
//    @Binding var priority: Bool
//    @Binding var isPresented: Bool
