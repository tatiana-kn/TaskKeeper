//
//  MainViewViewModel.swift
//  TaskKeeper
//
//  Created by Tia M on 4/14/24.
//

import FirebaseAuth
import Foundation

final class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    var isSignedIn: Bool {
        Auth.auth().currentUser != nil
    }
}
