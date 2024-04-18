//
//  TagsView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TagsView: View {
    @StateObject var viewModel: TagsViewViewModel
    @FirestoreQuery var items: [TaskItem]
    var tag: tagList

    
    init(userId: String, tag: tagList) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TagsViewViewModel(userId: userId))
        self.tag = tag

    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TaskListItemView(item: item)
                }
                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    TagsView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1", tag: tagList.toDo)
}
