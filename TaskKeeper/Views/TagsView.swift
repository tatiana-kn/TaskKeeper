//
//  TagsView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TagsView: View {
    @StateObject var viewModel: TaskListViewViewModel
    @FirestoreQuery var items: [TaskItem]
    
    init(userId: String, tag: tagList) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TaskListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tagList.allCases) { tag in
                    Section(tag.name) {
                        ForEach(items.filter { $0.tag == tag.rawValue }) { item in
                            TaskListItemView(item: item)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Active Tasks")
        }
    }
}

#Preview {
    TagsView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1", tag: tagList.toDo)
}

