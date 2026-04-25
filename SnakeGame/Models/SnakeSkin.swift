//
//  SnakeSkin.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import SwiftUI

enum SnakeSkin: String, CaseIterable {
    case classic  = "Classic"
    case neon     = "Neon"
    case fire     = "Fire"
    case ice      = "Ice"

    var headColor: Color {
        switch self {
        case .classic: return .green
        case .neon:    return .yellow
        case .fire:    return .orange
        case .ice:     return .cyan
        }
    }

    var bodyColor: Color {
        switch self {
        case .classic: return Color.green.opacity(0.7)
        case .neon:    return Color.yellow.opacity(0.7)
        case .fire:    return Color.red.opacity(0.7)
        case .ice:     return Color.blue.opacity(0.7)
        }
    }

    var foodColor: Color {
        switch self {
        case .classic: return .red
        case .neon:    return .purple
        case .fire:    return .yellow
        case .ice:     return .white
        }
    }

    var emoji: String {
        switch self {
        case .classic: return "🐍"
        case .neon:    return "⚡"
        case .fire:    return "🔥"
        case .ice:     return "❄️"
        }
    }

    var backgroundColors: [Color] {
        switch self {
        case .classic: return [Color.black, Color(white: 0.1)]
        case .neon:    return [Color.black, Color.purple.opacity(0.3)]
        case .fire:    return [Color.black, Color.red.opacity(0.2)]
        case .ice:     return [Color(white: 0.05), Color.blue.opacity(0.2)]
        }
    }
}
