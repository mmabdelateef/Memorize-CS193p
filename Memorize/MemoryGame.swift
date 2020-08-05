//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 05/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import Foundation

/// The model
struct MemoryGame<CardContent> {

    private(set) var cards: [Card]

    init(pairs: [CardContent]) {
        cards = pairs.enumerated().flatMap { pairIdx, val in
            [Card(id: pairIdx * 2, content: val),
             Card(id: pairIdx * 2 + 1, content: val)]
        }.shuffled()
    }

    func choose(card: Card) {
        print("choose card: \(card)")
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
