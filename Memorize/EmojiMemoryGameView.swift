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
            }
            .foregroundColor(viewModel.selectedTheme.color)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack { // combiner view
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius)
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
            .padding()
        }
    }

    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
