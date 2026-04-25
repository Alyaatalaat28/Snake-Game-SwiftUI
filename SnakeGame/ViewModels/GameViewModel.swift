//
//  GameViewModel.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import SwiftUI
import Combine

@MainActor
class GameViewModel: ObservableObject {

    // ── Published State ──
    @Published var snake: SnakeModel = SnakeModel()
    @Published var gameState: GameState = .home
    @Published var selectedSkin: SnakeSkin = .classic

    // ── Best Score ──
    @AppStorage("snake_best_score") var bestScore: Int = 0

    // ── Private ──
    private var timer: AnyCancellable?
    private var pendingDirection: Direction? = nil

    // ── Computed ──
    var score: Int { snake.score }
    var level: Int { snake.level }

    var speed: TimeInterval {
        switch snake.level {
        case 1:     return 0.18
        case 2:     return 0.15
        case 3:     return 0.12
        case 4:     return 0.10
        default:    return 0.08
        }
    }

    // ─────────────────────────────────────────
    // MARK: - Game Control
    // ─────────────────────────────────────────

    func startGame() {
        snake     = SnakeModel()
        gameState = .playing
        startTimer()
    }

    func pauseGame() {
        gameState = .paused
        stopTimer()
    }

    func resumeGame() {
        gameState = .playing
        startTimer()
    }

    func restartGame() {
        stopTimer()
        startGame()
    }

    func goHome() {
        stopTimer()
        gameState = .home
    }

    // ─────────────────────────────────────────
    // MARK: - Direction
    // ─────────────────────────────────────────

    func changeDirection(_ direction: Direction) {
        guard direction != snake.direction.opposite else { return }
        pendingDirection = direction
    }

    // ─────────────────────────────────────────
    // MARK: - Game Loop
    // ─────────────────────────────────────────

    private func startTimer() {
        stopTimer()
        timer = Timer.publish(every: speed, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    private func stopTimer() {
        timer?.cancel()
        timer = nil
    }

    private func tick() {
        // Apply pending direction
        if let pending = pendingDirection {
            snake.changeDirection(pending)
            pendingDirection = nil
        }

        let result = snake.move()

        switch result {
        case .moved:
            break
        case .ate:
            // Restart timer with new speed after level up
            startTimer()
        case .died:
            gameOver()
        }
    }

    private func gameOver() {
        stopTimer()
        if snake.score > bestScore {
            bestScore = snake.score
        }
        gameState = .gameOver
    }
}
