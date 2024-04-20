//
//  TagTabView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/20/24.
//

import SwiftUI

struct TagTabView: View {
    var opacity: Double
    var color: Color
    var tagName: String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 80, height: 30)
                .foregroundStyle(color)
                .opacity(opacity)
            
            Text(tagName)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    TagTabView(opacity: 0.9, color: .red, tagName: "To Do")
}
