//
//  ContentView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
//    @FocusState var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Task Keeper",
                           subtitle: "Get organized",
                           angle: 20, 
                           mainBackground: .minty,
                           propBackground: .redish)
                .padding(.top, 30)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TKButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("Don't have an account?")
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 30)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

//        ZStack {
//            VStack {
//                VStack {
//                    Text("Create new account")
//                        .font(.title)
//
//                    TextField("Enter your name", text: $name)
//                        .textFieldStyle(.roundedBorder)
//                        .focused($isInputActive)
//
//                    TextField("Enter your email", text: $password)
//                        .textFieldStyle(.roundedBorder)
//                        .focused($isInputActive)
//
//                    Button("CREARE ACCOUNT", action: {})
//                        .padding()
//                }
//                .padding()
//                Spacer()
//                Text("Already have an account?")
//                    .font(.title3)
//                Button("LOG IN", action: {})
//                    .padding()
//
//            }
//        }
//        .onTapGesture {
//            isInputActive = false
//        }
