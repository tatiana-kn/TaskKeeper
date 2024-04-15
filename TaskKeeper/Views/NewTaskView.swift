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
                
                TextField("Add tag", text: $viewModel.tag)
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
    }
}

#Preview {
    NewTaskView(isNewTaskPresented: .constant(true))
}

