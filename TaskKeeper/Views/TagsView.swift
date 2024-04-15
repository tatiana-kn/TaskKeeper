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
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TagsViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    Text(item.tag)
                }
                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    TagsView(userId: "tumTv7xUS0YP0uK12xxZwmt6WKw1")
}
