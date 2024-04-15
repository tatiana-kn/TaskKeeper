//
//  ProfileView.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                if let user = viewModel.user {
                    profile(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.minty)
            .frame(width: 100, height: 100)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
            }
            .padding()
        }
        .padding()
        Spacer()
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding(.bottom, 70)
    }
}

#Preview {
    ProfileView()
}
