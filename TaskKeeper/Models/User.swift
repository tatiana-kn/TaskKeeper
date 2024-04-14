//
//  User.swift
//  TaskKeeper
//
//  Created by Tia M on 4/13/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

