//
//  TaskListItemViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TaskItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
