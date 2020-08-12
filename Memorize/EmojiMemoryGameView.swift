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
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
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
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                }
            }
            .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
        }
    }

    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
