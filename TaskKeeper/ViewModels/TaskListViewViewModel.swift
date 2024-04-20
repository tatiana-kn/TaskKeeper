//
//  TaskListViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import FirebaseFirestore
import Foundation

final class TaskListViewViewModel: ObservableObject {
    @Published var isShowingNewTaskView = false
    @Published var showAlert = false
    @Published var pickedTag: String?

    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func deleteGroupOfTasks(ids: [String]) {
        for id in ids {
            delete(id: id)
        }
    }
}
