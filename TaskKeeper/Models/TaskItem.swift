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

enum tagList: String, CaseIterable, Identifiable {
    case toDo = "To Do"
    case personal = "Personal"
    case family = "Family"
    case activities = "Activities"
    case sport = "Sport"
    case shopping = "Shopping"
    case groceries = "Groceries"
    case work = "Work"
    case study = "Study"
    case leisure = "Leisure"
    
    var id: String {
        name
    }
    
    var name: String {
        rawValue
    }
}



