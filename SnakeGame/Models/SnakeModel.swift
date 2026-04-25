//
//  SnakeModel.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import Foundation

struct Point: Equatable {
    var x: Int
    var y: Int
}

struct SnakeModel {
    var body: [Point]         // body[0] = head
    var direction: Direction
    var food: Point
    var score: Int = 0
    var level: Int = 1
    let gridSize: Int = 20

    // ── Init ──
    init() {
        // Start in middle of grid
        let mid = 20 / 2
        body = [
            Point(x: mid,     y: mid),
            Point(x: mid - 1, y: mid),
            Point(x: mid - 2, y: mid)
        ]
        direction = .right
        food = Point(x: 0, y: 0)
        food = randomFood()
    }

    var head: Point { body[0] }

    // ── Move snake one step ──
    mutating func move() -> MoveResult {
        let newHead = nextHead()

        // Check wall collision
        if newHead.x < 0 || newHead.x >= gridSize ||
           newHead.y < 0 || newHead.y >= gridSize {
            return .died
        }

        // Check self collision
        if body.contains(newHead) {
            return .died
        }

        // Check food
        if newHead == food {
            body.insert(newHead, at: 0)   // grow
            score += 10 * level
            level = (score / 100) + 1     // level up every 100 points
            food = randomFood()
            return .ate
        }

        // Normal move
        body.insert(newHead, at: 0)
        body.removeLast()
        return .moved
    }

    mutating func changeDirection(_ newDirection: Direction) {
        // Prevent reversing
        guard newDirection != direction.opposite else { return }
        direction = newDirection
    }

    private func nextHead() -> Point {
        switch direction {
        case .up:    return Point(x: head.x,     y: head.y - 1)
        case .down:  return Point(x: head.x,     y: head.y + 1)
        case .left:  return Point(x: head.x - 1, y: head.y)
        case .right: return Point(x: head.x + 1, y: head.y)
        }
    }

    private func randomFood() -> Point {
        var newFood: Point
        repeat {
            newFood = Point(
                x: Int.random(in: 0..<gridSize),
                y: Int.random(in: 0..<gridSize)
            )
        } while body.contains(newFood)
        return newFood
    }
}

enum MoveResult {
    case moved
    case ate
    case died
}
