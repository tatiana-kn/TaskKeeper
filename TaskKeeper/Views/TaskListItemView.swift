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
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title)
                    .foregroundStyle(item.isDone ? .minty : .lemon)
            }
            
            Text(item.isHighPriority ? "!" : " ")
                .font(.title)
                .bold()
                .foregroundStyle(item.isDone ? .minty : .redish)
            
            VStack(alignment: .leading ) {
                Text(item.title)
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .omitted))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(item.tag.capitalized)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.trailing, 20)
        }
    }
}

#Preview {
    TaskListItemView(item: .init(id: "123", title: "Get sleep", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false, isHighPriority: true, tag: "personal"))
}

