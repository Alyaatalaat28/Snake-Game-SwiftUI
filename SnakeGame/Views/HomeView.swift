//
//  HomeView.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var navigateToGame = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: viewModel.selectedSkin.backgroundColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 40) {

                    Spacer()

                    // ── Title ──
                    VStack(spacing: 8) {
                        Text("🐍")
                            .font(.system(size: 80))
                        Text("Snake")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                        Text("Classic arcade game")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    // ── Best Score ──
                    if viewModel.bestScore > 0 {
                        HStack(spacing: 8) {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.yellow)
                            Text("Best: \(viewModel.bestScore)")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Capsule())
                    }

                    // ── Skin Selector ──
                    VStack(spacing: 12) {
                        Text("CHOOSE SKIN")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .kerning(2)

                        HStack(spacing: 12) {
                            ForEach(SnakeSkin.allCases, id: \.self) { skin in
                                Button {
                                    withAnimation(.spring()) {
                                        viewModel.selectedSkin = skin
                                    }
                                } label: {
                                    VStack(spacing: 6) {
                                        Text(skin.emoji)
                                            .font(.title2)
                                        Text(skin.rawValue)
                                            .font(.caption2)
                                            .foregroundColor(
                                                viewModel.selectedSkin == skin
                                                ? .black : .white
                                            )
                                    }
                                    .frame(width: 70, height: 60)
                                    .background(
                                        viewModel.selectedSkin == skin
                                        ? skin.headColor
                                        : Color.white.opacity(0.1)
                                    )
                                    .cornerRadius(14)
                                }
                            }
                        }
                    }

                    // ── Start Button ──
                    Button {
                        viewModel.startGame()
                        navigateToGame = true
                    } label: {
                        Text("Start Game 🎮")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(viewModel.selectedSkin.headColor)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 4)
                    }
                    .padding(.horizontal, 32)

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToGame) {
                GameView(viewModel: viewModel)
                    .onChange(of: viewModel.gameState) { _, state in
                        if state == .home {
                            navigateToGame = false
                        }
                    }
            }
        }
    }
}
