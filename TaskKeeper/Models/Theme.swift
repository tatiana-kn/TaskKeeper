//
//  Theme.swift
//  TaskKeeper
//
//  Created by Tia M on 3/23/24.
//

import SwiftUI

enum Theme: String {
    case lemon
    case redish
    case grass
    case sky
    case minty
    case pinky
    case lilac
    case violet
    case navy
    case ice
    
    var mainColor: Color {
        Color(rawValue)
    }
}
