//
//  PauseOverlay.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import SwiftUI

struct PauseOverlay: View {
    let onResume: () -> Void
    let onRestart: () -> Void
    let onHome: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("⏸️")
                    .font(.system(size: 60))

                Text("Paused")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)

                VStack(spacing: 12) {
                    PauseButton(
                        title: "Resume",
                        icon: "play.fill",
                        color: .green,
                        action: onResume
                    )
                    PauseButton(
                        title: "Restart",
                        icon: "arrow.clockwise",
                        color: .orange,
                        action: onRestart
                    )
                    PauseButton(
                        title: "Home",
                        icon: "house.fill",
                        color: .red,
                        action: onHome
                    )
                }
                .padding(.horizontal, 48)
            }
        }
    }
}

struct PauseButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(color.opacity(0.8))
            .cornerRadius(14)
        }
    }
}
