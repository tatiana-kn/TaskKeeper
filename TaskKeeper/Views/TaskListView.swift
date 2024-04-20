//
//  TaskListView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel: TaskListViewViewModel
    @FirestoreQuery var items: [TaskItem]
    @State private var pickedTag: String?
    
    private let taskStatus = ["Active Tasks": false, "Completed Tasks": true]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TaskListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    pickedTag = nil
                } label: {
                    TagTabView(opacity: (pickedTag == nil ? 0.9 : 0.4),
                               color: .teal,
                               tagName: "All")
                }
                tagScrollView()
            }
            .padding()
            
            List {
                ForEach(taskStatus.keys.sorted(), id: \.self) { key in
                    taskSection(for: items, name: key, isDone: taskStatus[key] ?? true)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Tasks")
            .toolbar {
                Button{
                    viewModel.isShowingNewTaskView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title)
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewTaskView) {
                NewTaskView(isNewTaskPresented: $viewModel.isShowingNewTaskView)
            }
        }
    }
    
    @ViewBuilder
    private func tagScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tagList.allCases, id: \.self) { tag in
                    Button {
                        pickedTag = tag.name
                    } label: {
                        TagTabView(opacity: (pickedTag == tag.name ? 0.9 : 0.4),
                                   color: tag.color,
                                   tagName: tag.name.capitalized)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func taskSection(for items: [TaskItem], name: String, isDone: Bool) -> some View {
        Section(name) {
            ForEach(items.filter { isDone == $0.isDone && isTagPicked($0) }) { item in
                TaskListItemView(item: item)
                    .swipeActions{
                        editMenu(item: item)
                    }
            }
        }
    }
    
    @ViewBuilder
    private func editMenu(item: TaskItem) -> some View {
        Button("Delete") {
            viewModel.delete(id: item.id)
        }
        .tint(.redish)
        NavigationLink("Edit") {
            TaskEditView(taskId: item.id)
        }
        .tint(.lemon)
    }
    
    private func isTagPicked(_ item: TaskItem) -> Bool {
        pickedTag == nil || item.tag == pickedTag
    }
    
}

#Preview {
    TaskListView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1")
}

