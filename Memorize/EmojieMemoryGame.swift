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

    private let themes: [Theme] = [
        Theme(name: "Smilies", emojis: ["🧐", "🤪", "🤨", "😳", "😬", "🤗", "🥱"], color: Color.yellow),
        Theme(name: "Sea", emojis: ["🐙", "🐳", "🦑", "🦐", "🦈", "🦀", "🐠", "🐡"], color: Color.blue),
        Theme(name: "Animals", emojis: ["🦒", "🦏", "🐫", "🦓", "🐆", "🐅", "🐘", "🦍", "🐃"], color: Color.black),
        Theme(name: "Plants", emojis: ["🌲", "🌾", "🌴", "🌳", "🍀", "🌵", "🎋", "🌿"], color: Color.green),
    ]

    private static func createRandomPairs(min: Int = 4, max: Int = 6, from emojis: [String]) -> [String] {
        let count = Int.random(in: min...max)
        return Array(emojis[0..<count])
    }

    init() {
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
        let randomTheme = themes.randomElement()!
        selectedTheme = randomTheme
        model = MemoryGame<String>(pairs: EmojiMemoryGame.createRandomPairs(from: randomTheme.emojis))
    }
}

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
}
