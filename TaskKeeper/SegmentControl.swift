//
//  File.swift
//  TaskKeeper
//
//  Created by Tia M on 4/8/24.
//

import SwiftUI

struct SegmentControl: View {

    var body: some View {
        HStack(alignment: .bottom){
            Button("Log In") {}
            .font(.title)
            
            Text("/")
                .font(.title)
            
            Button("Sign Up") {}
            .font(.title3)
            
        }
        
    }
}

#Preview {
    SegmentControl()
}
