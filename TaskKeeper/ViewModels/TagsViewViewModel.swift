//
//  TagsViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import FirebaseFirestore
import Foundation

class TagsViewViewModel: ObservableObject {
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}
