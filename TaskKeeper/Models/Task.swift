//
//  Task.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import Foundation

struct Task: Identifiable {    
    var id = UUID()
    
    var title: String
    var description: String = ""
    var tag: Tag?
    
    var priority: Priority = .medium
    var dueDate: Date?
    var estimatedTime: Int?
    var trackedTime: Int = 0
    var project: Project? = Project(title: "To do")
    var status: Status = .created
    
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
    case created
}

struct Project: Identifiable {
    var id = UUID()
    
    var title: String
    var description: String?
    var taskList: [Task]? = []
    var icon: String?
    
    var dueDate: Date?
    var estimatedTime: Int?
    var trackedTime: Int = 0
    var theme: Theme?
    var status: Status = .created
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
    var statistic: [Int] = []
}

enum HabitType {
    case build
    case quit
}

extension Task {
    static let sampleTask: [Task] = [
        Task(title: "Buy lemons"),
        Task(title: "Read", description: "10 pages", status: Status.inProgress),
        Task(title: "Create app", description: "Task App", tag: Tag(name: "work"), priority: Priority.high, trackedTime: 10, project: Project(title: "iOS")),
        Task(title: "Meditate", tag: Tag(name: "personal"), trackedTime: 25, project: Project(title: "Mindfulness"))
    ]
}

extension Project {
    static let sampleProject: [Project] = [
        Project(title: "Work"),
        Project(title: "iOS", description: "learning and creating", taskList: [Task.sampleTask[2]], icon: "apps.iphone.badge.plus", trackedTime: 35, theme: .redish, status: .inProgress),
        Project(title: "Mindfullness", taskList: [Task.sampleTask[3]], icon: "figure.mind.and.body", trackedTime: 15, theme: .minty)
    ]
}
