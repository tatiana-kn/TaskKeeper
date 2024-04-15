//
//  ContentView.swift
//  TaskKeeper
//
//  Created by Tia M on 3/22/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Task Keeper",
                           subtitle: "Get organized",
                           angle: 12,
                           mainBackground: .redish,
                           propBackground: .minty)
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
                    
                    TKButton(title: "Log In", background: .navy) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -70)
                
                VStack {
                    Text("Don't have an account?")
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    LoginView()
}

