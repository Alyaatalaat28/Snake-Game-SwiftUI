//
//  CanvasView.swift
//  SnakeGame
//
//  Created by Alyaa on 4/25/26.
//

import SwiftUI

struct CanvasView: View {
    let snake: SnakeModel
    let skin: SnakeSkin

    var body: some View {
        GeometryReader { geo in
            let cellSize = geo.size.width / CGFloat(snake.gridSize)

            Canvas { context, size in

                // ── Draw grid ──
                for x in 0..<snake.gridSize {
                    for y in 0..<snake.gridSize {
                        let rect = CGRect(
                            x: CGFloat(x) * cellSize + 1,
                            y: CGFloat(y) * cellSize + 1,
                            width: cellSize - 2,
                            height: cellSize - 2
                        )
                        context.fill(
                            Path(roundedRect: rect, cornerRadius: 2),
                            with: .color(Color.white.opacity(0.03))
                        )
                    }
                }

                // ── Draw food ──
                let foodRect = CGRect(
                    x: CGFloat(snake.food.x) * cellSize + 2,
                    y: CGFloat(snake.food.y) * cellSize + 2,
                    width: cellSize - 4,
                    height: cellSize - 4
                )
                context.fill(
                    Path(ellipseIn: foodRect),
                    with: .color(skin.foodColor)
                )

                // ── Draw snake body ──
                for (index, point) in snake.body.enumerated() {
                    let rect = CGRect(
                        x: CGFloat(point.x) * cellSize + 1,
                        y: CGFloat(point.y) * cellSize + 1,
                        width: cellSize - 2,
                        height: cellSize - 2
                    )
                    let color = index == 0 ? skin.headColor : skin.bodyColor
                    let radius = index == 0 ? cellSize / 2 : cellSize / 3
                    context.fill(
                        Path(roundedRect: rect, cornerRadius: radius),
                        with: .color(color)
                    )
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
