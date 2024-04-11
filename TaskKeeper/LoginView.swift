//
//  ContentView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var password = ""
    @FocusState var isInputActive: Bool
    
    var body: some View {
        SegmentControl()
        
        ZStack {
            VStack {
                VStack {
                    Text("Create new account")
                        .font(.title)
                    
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .focused($isInputActive)
        
                    TextField("Enter your email", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .focused($isInputActive)
                    
                    Button("CREARE ACCOUNT", action: {})
                        .padding()
                }
                .padding()
                Spacer()
                Text("Already have an account?")
                    .font(.title3)
                Button("LOG IN", action: {})
                    .padding()
                
            }
        }
        .onTapGesture {
            isInputActive = false
        }
    }
}

#Preview {
    LoginView()
}
