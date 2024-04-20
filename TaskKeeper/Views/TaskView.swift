//
//  TaskView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/18/24.
//

import SwiftUI

struct TaskView: View {
    @Binding var title: String
    @Binding var tag: String
    @Binding var dueDate: Date
    @Binding var isHighPriority: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            Form {
                TextField("Task title", text: $title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                Picker("Tags", selection: $tag ) {
                    ForEach(tagList.allCases) { tag in
                        Text(tag.rawValue)
                    }
                }
                
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                
                HStack {
                    Text("Set High Priority")
                    Spacer()
                    
                    Text(isHighPriority ? "!" : "")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.redish)
                    
                    Button {
                        isHighPriority.toggle()
                    } label: {
                        Image(systemName: isHighPriority ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                            .foregroundStyle(isHighPriority ? .redish : .minty)
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

#Preview {
    TaskView(title: .constant("Test"), tag: .constant("To Do"), dueDate: .constant(Date()), isHighPriority: .constant(false), action: {})
}
