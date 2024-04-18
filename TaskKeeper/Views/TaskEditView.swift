//
//  TaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/17/24.
//

import SwiftUI

struct TaskEditView: View {
    
    @StateObject var viewModel = TaskEditViewViewModel()
    @State var taskId: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TaskView(title: $viewModel.title,
                 tag: $viewModel.tag,
                 dueDate: $viewModel.dueDate,
                 isHighPriority: $viewModel.isHighPriority,
                 action: updateTask)
        .navigationTitle("Task Details")
        .onAppear {
            viewModel.loadTask(taskId: taskId)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Can't update the task"),
                  message: Text("Please fill in all fields"))
        }
    }
    
    func updateTask() {
        if viewModel.canSave {
            viewModel.update(itemId: taskId)
            dismiss()
        } else {
            viewModel.showAlert = true
        }
    }
}

#Preview {
    TaskEditView(taskId: "DFC08990-DF0E-49B5-8E83-95A59D3497BC")
}
