//
//  GameView.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: viewModel.selectedSkin.backgroundColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {

                // ── Header ──
                HStack {
                    // Score
                    VStack(alignment: .leading, spacing: 2) {
                        Text("SCORE")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .kerning(1)
                        Text("\(viewModel.score)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    Spacer()

                    // Pause button
                    Button {
                        viewModel.pauseGame()
                    } label: {
                        Image(systemName: "pause.circle.fill")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.7))
                    }

                    Spacer()

                    // Level
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("LEVEL")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .kerning(1)
                        Text("\(viewModel.level)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)

                // ── Snake Canvas ──
                CanvasView(
                    snake: viewModel.snake,
                    skin: viewModel.selectedSkin
                )
                .padding(12)
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
                .padding(.horizontal, 12)

                // ── Swipe Controls ──
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .gesture(
                        DragGesture(minimumDistance: 20)
                            .onEnded { value in
                                let h = value.translation.width
                                let v = value.translation.height

                                if abs(h) > abs(v) {
                                    viewModel.changeDirection(h > 0 ? .right : .left)
                                } else {
                                    viewModel.changeDirection(v > 0 ? .down : .up)
                                }
                            }
                    )
            }

            // ── Pause Overlay ──
            if viewModel.gameState == .paused {
                PauseOverlay(
                    onResume:  { viewModel.resumeGame()  },
                    onRestart: { viewModel.restartGame() },
                    onHome:    { viewModel.goHome()      }
                )
                .transition(.opacity)
            }

            // ── Game Over Overlay ──
            if viewModel.gameState == .gameOver {
                GameOverView(
                    viewModel: viewModel,
                    onPlayAgain: { viewModel.restartGame() },
                    onHome:      { viewModel.goHome()      }
                )
                .transition(.opacity)
            }
        }
        .navigationBarHidden(true)
        .animation(.easeInOut(duration: 0.3), value: viewModel.gameState)
    }
}
