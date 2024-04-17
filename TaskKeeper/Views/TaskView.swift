//
//  TaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/17/24.
//

import SwiftUI

struct TaskView: View {

    @StateObject var viewModel = NewTaskViewViewModel()
    let action: () -> Void
    @State var task: TaskItem

    
    var body: some View {
        VStack {
            Form {
                TextField("Task title", text: $task.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Tag", text: $task.tag)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: [.date])
                
                HStack {
                    Text("Set High Priority")
                    Spacer()
                    
                    Text(task.isHighPriority ? "!" : "")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.redish)
                    
                    Button {
                        task.isHighPriority.toggle()
                    } label: {
                        Image(systemName: task.isHighPriority ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                            .foregroundStyle(task.isHighPriority ? .redish : .minty)
                    }
                }
                
                TKButton(title: "Save", background: .minty) {
                    action()
                }
                .padding()
            }
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
