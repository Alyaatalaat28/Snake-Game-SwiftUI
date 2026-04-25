//
//  Direction.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import Foundation

enum Direction {
    case up, down, left, right

    // Prevent reversing into yourself
    var opposite: Direction {
        switch self {
        case .up:    return .down
        case .down:  return .up
        case .left:  return .right
        case .right: return .left
        }
    }
}
