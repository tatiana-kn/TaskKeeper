//
//  TaskKeeperApp.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import FirebaseCore
import SwiftUI

@main
struct TaskKeeperApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
