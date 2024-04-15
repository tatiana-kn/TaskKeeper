//
//  RegisterView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Get organized with Task Keeper",
                angle: 12,
                mainBackground: .minty,
                propBackground: .redish)
        }
            
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
            }
            
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TKButton(title: "Create Account", background: .minty) {
                viewModel.register()
            }
            .padding()
        }
        .offset(y: -70)
    }
}

#Preview {
    RegisterView()
}
