# 🐍 Snake Game

A classic Snake game built with SwiftUI. Built as a learning project to explore Swift and SwiftUI concepts.

## Features

- Choose from 4 skins (Classic, Neon, Fire, Ice)
- D-pad buttons + swipe gesture controls
- Level system with increasing speed
- Score tracking per game
- Best score persistence
- Clean gradient UI per skin

## Screens

- **Home** — skin selector and best score
- **Game** — snake canvas with D-pad controls
- **Pause** — resume, restart, or go home
- **Game Over** — score summary with new best detection

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 14 49 53" src="https://github.com/user-attachments/assets/7ce5ba21-6943-4b9e-a23a-f489ff073b69" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 15 02 09" src="https://github.com/user-attachments/assets/d978a8c3-a7d9-4dea-94a0-3719a2c06293" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 15 00 27" src="https://github.com/user-attachments/assets/4c3ba326-4ddb-4f4e-85e5-5af5fda72cb9" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 15 01 15" src="https://github.com/user-attachments/assets/32514f36-93df-4ea9-a3b4-d16470505b0f" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 15 01 26" src="https://github.com/user-attachments/assets/29cbaa7b-e7fd-432c-9403-100f3e685946" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 14 50 23" src="https://github.com/user-attachments/assets/76e507de-b07f-4a28-8eb1-28b8fd150682" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-04-25 at 14 50 09" src="https://github.com/user-attachments/assets/52309168-6616-4454-ac4d-d6cad4ddd63d" />

## Concepts Learned

- `@StateObject` and `@ObservedObject`
- `ObservableObject` and `@Published` with Combine
- `@AppStorage` for persistence
- `NavigationStack` and `navigationDestination`
- `Timer.publish` for the game loop
- `Canvas` for performant 2D rendering
- Enum-driven state machine (`GameState`, `Direction`, `MoveResult`)
- Reusable view components

## Tech Stack

- Swift 5.9+
- SwiftUI
- Combine
- Xcode 16+
- iOS 17+
