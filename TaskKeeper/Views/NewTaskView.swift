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
            VStack {
                Form {
                    TextField("Add task title", text: $viewModel.title)
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
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewTaskView(isNewTaskPresented: .constant(true))
}

