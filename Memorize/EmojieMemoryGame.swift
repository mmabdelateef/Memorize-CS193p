//
//  EmojieMemoryGame.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 05/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import Foundation

/// The viewModel
class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model = MemoryGame<String>(pairs: EmojiMemoryGame.createRandomPairs())
//    {
//        didSet {
//            objectWillChange.send()
//        }
//    }

    private static func createRandomPairs(min: Int = 2, max: Int = 4) -> [String] {
        let count = Int.random(in: min...max)
        let emojisSet = ["👻", "🧐", "🤪", "🤨", "😳", "😬", "🤗", "🥱", "🎃", "😼"].shuffled()
        return Array(emojisSet[0..<count])
    }

    // MARK: - Access to the model

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intents

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
