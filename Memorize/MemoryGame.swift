//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 05/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import Foundation

/// The model
struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card]
    private var seenCardIds: Set<Int> = []
    private(set) var score = 0

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for idx in cards.indices {
                cards[idx].isFaceUp = idx == newValue
            }
        }
    }

    init(pairs: [CardContent]) {
        cards = pairs.enumerated().flatMap { pairIdx, val in
            [Card(id: pairIdx * 2, content: val),
             Card(id: pairIdx * 2 + 1, content: val)]
        }.shuffled()
    }

    mutating func choose(card: Card) {
        defer { seenCardIds.insert(card.id) }

        print("choose card: \(card)")
        guard let choosingIdx = index(of: card),
              !cards[choosingIdx].isFaceUp,
              !cards[choosingIdx].isMatched
        else { return }

        if let potentialMatchIdx = indexOfTheOneAndOnlyFaceUpCard,
           cards[potentialMatchIdx].content == cards[choosingIdx].content {
            //Whoooa!
            cards[choosingIdx].isMatched = true
            cards[potentialMatchIdx].isMatched = true
            score += 2
        } else {
            indexOfTheOneAndOnlyFaceUpCard = choosingIdx
            if seenCardIds.contains(card.id) {
                score -= 1
            }
        }

        cards[choosingIdx].isFaceUp = true
    }

    private func index(of card: Card) -> Int? {
        cards.firstIndex { $0.id == card.id }
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
