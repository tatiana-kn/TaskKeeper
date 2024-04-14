//
//  TKButton.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import SwiftUI

struct TKButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TKButton(title: "Log In", background: .blue, action: {})
}
