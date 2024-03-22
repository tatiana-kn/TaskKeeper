//
//  Task.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import Foundation

struct Task {
    var title: String
    var description: String
    var tag: Tag
    
    var priority: Priority
    var dueDate: Date
    var estimatedTime: Int
    var trackedTime: Int
    var project: Project
    var status: Status
}

enum Priority {
    case low
    case medium
    case high
}

enum Status {
    case done
    case inProgress
    case notStarted
    case new
}

struct Project {
    var title: String
    var description: String
    var taskList: [Task]
    
    var dueDate: Date
    var estimatedTime: Int
    var trackedTime: Int
    var theme: Theme
    var status: Status
}

struct Theme {
    
}

struct Tag {
    var name: String
}

struct Habit {
    var title: String
    var description: String
    var tag: Tag
    var goal: Int
    var type: HabitType
    var statistic: [Int]
}

enum HabitType {
    case build
    case quit
}

