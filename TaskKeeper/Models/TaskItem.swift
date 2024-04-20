//
//  TaskItem.swift
//  TaskKeeper
//
//  Created by Tia M on 4/15/24.
//

import SwiftUI

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
    
    var color: Color {
        switch self {
        case .toDo:
            Theme.grass.mainColor
        case .personal:
            Theme.redish.mainColor
        case .family:
            Theme.minty.mainColor
        case .activities:
            Theme.sky.mainColor
        case .shopping:
            Theme.pinky.mainColor
        case .groceries:
            Theme.lilac.mainColor
        case .work:
            Theme.violet.mainColor
        case .study:
            Theme.navy.mainColor
        case .leisure:
            Theme.ice.mainColor
        }
    }
}





