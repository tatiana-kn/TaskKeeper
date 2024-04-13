//
//  Task.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import Foundation
import Observation

//сделать проект основной моделью, а таск вторичной. Таск создается внутри контекста проекта. Проект по умолчанию ToDo.
@Observable final class Tasks {
    var taskList: [Task] = []
//    var projectList: [Project] = []
}

struct Task: Identifiable {  
//    static var taskList: [Task] = []
    var id = UUID()
    
    var title: String
    var description: String = ""
    
    var priority: Priority = .medium
    var dueDate: Date?
    var estimatedTime: Int?
    var trackedTime: Int = 0
    var project: Project? = Project(title: "To do")
    var status: Status = .created
    
//    static func create(task: Task) {
//        taskList.append(task)
//    }
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

struct Habit {
    var title: String
    var description: String
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
        Task(title: "Create app", description: "Task App", priority: Priority.high, trackedTime: 10, project: Project(title: "iOS")),
        Task(title: "Meditate", trackedTime: 25, project: Project(title: "Mindfulness"))
    ]
}

extension Project {
    static let sampleProject: [Project] = [
        Project(title: "Work"),
        Project(title: "iOS", description: "learning and creating", taskList: [Task.sampleTask[2]], icon: "apps.iphone.badge.plus", trackedTime: 35, theme: .redish, status: .inProgress),
        Project(title: "Mindfullness", taskList: [Task.sampleTask[3]], icon: "figure.mind.and.body", trackedTime: 15, theme: .minty)
    ]
}
