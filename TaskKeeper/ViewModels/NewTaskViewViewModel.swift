//
//  NewTaskViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

final class NewTaskViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var isHighPriority = false
    @Published var tag = tagList.toDo.rawValue
    
    init() {}
    
    func save() {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
            let newId = UUID().uuidString
            let newItem = TaskItem(
                id: newId,
                title: title,
                dueDate: dueDate.timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false,
                isHighPriority: isHighPriority,
                tag: tag
            )
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uId)
                .collection("todos")
                .document(newId)
                .setData(newItem.asDictionary())

    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
}
