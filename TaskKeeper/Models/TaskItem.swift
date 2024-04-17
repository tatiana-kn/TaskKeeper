//
//  TaskItem.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import Foundation

struct TaskItem: Codable, Identifiable {
    let id: String
    var title: String
    var dueDate: TimeInterval
    var createdDate: TimeInterval
    var isDone: Bool
    var isHighPriority: Bool
    var tag: String
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

//struct Project: Codable, Identifiable {
//    let id: String
//    let title: String
//}
