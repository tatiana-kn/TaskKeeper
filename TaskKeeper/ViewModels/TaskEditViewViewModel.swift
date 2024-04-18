//
//  TaskViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/17/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskEditViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var isHighPriority = false
    @Published var tag = ""
    
    @Published var isLoading = true
    
    init() {}
    
    func loadTask(taskId: String) {
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(taskId)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else { return }
                
                DispatchQueue.main.async {
                    self?.title = data["title"] as? String ?? ""
                    if let dueDateInterval = data["dueDate"] as? TimeInterval {
                        self?.dueDate = Date(timeIntervalSince1970: dueDateInterval)
                    } else {
                        self?.dueDate = Date()
                    }
                    self?.isHighPriority = data["isHighPriority"] as? Bool ?? false
                    self?.tag = data["tag"] as? String ?? ""
                    
                    self?.isLoading = false
                }
            }
    }
    
    func update(itemId: String) {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let updatedItem = TaskItem(
            id: itemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: dueDate.timeIntervalSince1970,
            isDone: false,
            isHighPriority: isHighPriority,
            tag: tag
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(updatedItem.id)
            .updateData(updatedItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
}
