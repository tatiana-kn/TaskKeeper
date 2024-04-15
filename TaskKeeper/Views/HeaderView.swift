//
//  HeaderView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/13/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let mainBackground: Color
    let propBackground: Color
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(propBackground)
                .rotationEffect(Angle(degrees: angle))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(.lemon)
                .rotationEffect(Angle(degrees: -17))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(mainBackground)
                .rotationEffect(Angle(degrees: -angle/2))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
            }
            .padding(.top, 60)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Task Keeper", subtitle: "Get organized", angle: 20, mainBackground: .redish, propBackground: .minty)
}
