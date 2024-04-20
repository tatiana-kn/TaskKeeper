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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            TaskView(title: $viewModel.title,
                     tag: $viewModel.tag,
                     dueDate: $viewModel.dueDate,
                     isHighPriority: $viewModel.isHighPriority,
                     action: saveTask)
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields"))
            }
        }
    }
    
    func saveTask() {
        if viewModel.canSave {
            viewModel.save()
            isNewTaskPresented = false
        } else {
            viewModel.showAlert = true
        }
    }
}

#Preview {
    NewTaskView(isNewTaskPresented: .constant(true))
}
