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
        NavigationView {
            VStack {
                List(items) { item in
                    TaskListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
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
}

#Preview {
    TaskListView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1")
}
