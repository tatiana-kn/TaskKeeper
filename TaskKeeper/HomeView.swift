//
//  HomeView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct HomeView: View {
    var tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            Text("\(task.title)")
        }
    }
}

#Preview {
    HomeView(tasks: Task.sampleTask)
}
