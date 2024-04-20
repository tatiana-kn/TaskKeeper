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
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TaskListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    viewModel.pickedTag = nil
                } label: {
                    TagTabView(opacity: (viewModel.pickedTag == nil ? 0.9 : 0.4),
                               color: .teal,
                               tagName: "All")
                }
                tagScrollView()
            }
            .padding()
            
            List {
                taskSection(for: items, name: "Active Tasks", isDone: false)
                taskSection(for: items, name: "Completed Tasks", isDone: true)
            }
            .listStyle(.plain)
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    viewModel.showAlert = true
                } label: {
                    Image(systemName: "rectangle.stack.badge.minus")
                        .tint(.redish)
                }
                
                Spacer()
                Button{
                    viewModel.isShowingNewTaskView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewTaskView) {
                NewTaskView(isNewTaskPresented: $viewModel.isShowingNewTaskView)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Attention!"),
                message: Text("Are you sure you want to delete ALL completed tasks?"),
                primaryButton: .destructive(Text("Delete"), action: deleteCompletedTasks),
                secondaryButton: .cancel()
            )
        }
    }
    
    @ViewBuilder
    private func tagScrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tagList.allCases, id: \.self) { tag in
                    Button {
                        viewModel.pickedTag = tag.name
                    } label: {
                        TagTabView(opacity: (viewModel.pickedTag == tag.name ? 0.9 : 0.4),
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
        viewModel.pickedTag == nil || item.tag == viewModel.pickedTag
    }
    
    private func deleteCompletedTasks() {
        let completedTasks = items.filter { $0.isDone }
        let completedTaskIds = completedTasks.map { $0.id }
        
        viewModel.deleteGroupOfTasks(ids: completedTaskIds)
    }
}

#Preview {
    TaskListView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1")
}

