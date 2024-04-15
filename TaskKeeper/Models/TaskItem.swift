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

struct ProjectItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isFinished: Bool
    var taskList: [TaskItem]
    
    mutating func setFinished(_ state: Bool) {
        isFinished = state
    }
}
