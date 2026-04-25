//
//  GameOverView.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//
import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: GameViewModel
    let onPlayAgain: () -> Void
    let onHome: () -> Void

    var isNewBest: Bool { viewModel.score == viewModel.bestScore && viewModel.score > 0 }

    var body: some View {
        ZStack {
            Color.black.opacity(0.85)
                .ignoresSafeArea()

            VStack(spacing: 32) {

                // ── Title ──
                VStack(spacing: 8) {
                    Text("💀")
                        .font(.system(size: 70))
                    Text("Game Over")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)

                    if isNewBest {
                        Text("🎉 New High Score!")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.yellow.opacity(0.2))
                            .clipShape(Capsule())
                    }
                }

                // ── Score Card ──
                VStack(spacing: 0) {
                    GameOverRow(
                        icon: "star.fill",
                        label: "Score",
                        value: "\(viewModel.score)"
                    )
                    Divider().overlay(Color.gray.opacity(0.2))

                    GameOverRow(
                        icon: "speedometer",
                        label: "Level",
                        value: "\(viewModel.level)"
                    )
                    Divider().overlay(Color.gray.opacity(0.2))

                    GameOverRow(
                        icon: "trophy.fill",
                        label: "Best Score",
                        value: "\(viewModel.bestScore)",
                        highlight: true
                    )
                }
                .background(Color.white.opacity(0.08))
                .cornerRadius(20)
                .padding(.horizontal, 32)

                // ── Buttons ──
                VStack(spacing: 12) {
                    Button(action: onPlayAgain) {
                        Text("Play Again 🎮")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color.green)
                            .cornerRadius(20)
                    }

                    Button(action: onHome) {
                        Text("Home")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 32)
            }
        }
    }
}

struct GameOverRow: View {
    let icon: String
    let label: String
    let value: String
    var highlight: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(highlight ? .yellow : .green)
                .frame(width: 24)
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.bold)
                .foregroundColor(highlight ? .yellow : .white)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}
