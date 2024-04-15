//
//  TaskListItemView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import SwiftUI

struct TaskListItemView: View {
    @StateObject var viewModel = TaskListItemViewViewModel()
    
    let item: TaskItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading ) {
                Text(item.title)
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .omitted))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TaskListItemView(item: .init(id: "123", title: "Get sleep", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
