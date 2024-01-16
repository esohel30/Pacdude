# Pac-Dude: A Processing-Based Arcade Game

## Project Overview

"Pac-Dude" is a dynamic reimagining of the classic Pac-Man game, developed using the Processing language. This project not only offers a nostalgic arcade experience but also incorporates advanced programming concepts, including sophisticated pathfinding algorithms and state management for the ghost characters.

## Key Features

- **Enhanced Gameplay Mechanics**: Combines traditional Pac-Man gameplay with new challenges and dynamic difficulty scaling.
- **Custom Map Generation**: Algorithmically generated maps provide a unique experience in each game session.
- **Interactive Sound Effects**: Integrated audio enhances player immersion.
- **Object-Oriented Design**: Modular and reusable code using classes like `PacDude`, `Map`, and `Ghost`.
- **Advanced Pathfinding Algorithms**: Ghosts use complex algorithms to chase and ambush the player, adding to the game's challenge.
- **Sophisticated State Management**: Ghosts switch between different states such as 'Chase', 'Scatter', and 'Frightened', each affecting their behavior and strategy.
- **Collision Detection and Response**: Critical for gameplay mechanics, ensuring accurate interactions within the game environment.

## Pathfinding Algorithms

The ghost characters in "Pac-Dude" use a variety of pathfinding algorithms to create a challenging experience:

- **Chase Mode**: Each ghost has a unique chasing strategy, from directly pursuing Pac-Dude to predicting his future position.
- **Scatter Mode**: Ghosts temporarily stop chasing Pac-Dude and retreat to their home corners, giving players short breaks.
- **Frightened Mode**: When Pac-Dude consumes a power pellet, ghosts enter a vulnerable state where their movement becomes erratic, providing an opportunity for Pac-Dude to catch them.

## Ghost States

Ghosts transition through various states, each dictating their behavior:

1. **Chase**: Focus on catching Pac-Dude using their unique pathfinding methods.
2. **Scatter**: Retreat to their respective corners, changing their pathfinding targets.
3. **Frightened**: Random movement, making them vulnerable to Pac-Dude.
4. **Eaten**: Once caught, they return to the ghost house before re-entering the game.

## Getting Started

### Prerequisites

- Processing IDE ([Download](https://processing.org/download/))

### Installation

1. Clone or download this repository.
2. Import offical Sound Library
3. Run Gamerunner.pde
