//
//  TaskItem.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import Foundation

struct TaskItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    var isHighPriority: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}