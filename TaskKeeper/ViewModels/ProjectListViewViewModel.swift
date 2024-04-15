//
//  ProjectListViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseFirestore
import Foundation

class ProjectListViewViewModel: ObservableObject {
    @Published var isShowingNewProjectView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos") // edit
            .document(id)
            .delete()
        
    }
}
