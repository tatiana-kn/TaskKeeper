//
//  ProjectListItemViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProjectListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsFinished(item: ProjectItem) {
        var itemCopy = item
        itemCopy.setFinished(!item.isFinished)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos") // change
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
