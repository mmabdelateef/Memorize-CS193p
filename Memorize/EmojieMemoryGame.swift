//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 05/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

/// The viewModel
class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String>!
    @Published var selectedTheme: Theme!
//    {
//        didSet {
//            objectWillChange.send()
//        }
//    }

    private static func createRandomPairs(min: Int = 4, max: Int = 6, from emojis: [String]) -> [String] {
        let count = Int.random(in: min...max)
        return Array(emojis[0..<count])
    }

    deinit {
        print("Dalloc")
    }

    let themeStore: ThemeStore

    init(theme: Theme, themeStore: ThemeStore) {
        self.selectedTheme = theme
        self.themeStore = themeStore
        newGame()
    }

    // MARK: - Access to the model

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intents

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func newGame() {
        model = MemoryGame<String>(pairs: EmojiMemoryGame.createRandomPairs(min: selectedTheme.emojis.count, max: selectedTheme.emojis.count, from: selectedTheme.emojis))
    }
}

struct Theme: Identifiable {
    var id = UUID()
    var name: String
    var emojis: [String]
    var color: Color
}
