//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 03/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            HStack {
                Text("Score: \(viewModel.model.score)")
                Spacer()
                Button("New Game") {
                    viewModel.newGame()
                }
            }.padding()
            Text(viewModel.selectedTheme.name)
                .font(Font.largeTitle)
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }.animation(.easeInOut)
            .foregroundColor(viewModel.selectedTheme.color)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            if !card.isMatched {
                Text(card.content).cardify(isFaceUp: card.isFaceUp)
                .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
                .padding()
            }
        }
    }

    // MARK: - Drawing constants
    let fontScaleFactor: CGFloat = 0.5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = EmojiMemoryGame()
        vm.choose(card: vm.cards.first!)
        return Group {
            EmojiMemoryGameView(viewModel: vm)
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
