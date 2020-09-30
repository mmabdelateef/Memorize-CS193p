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
                    withAnimation {
                        viewModel.newGame()
                    }
                }
            }.padding()
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.linear(duration:0.4)) {
                        self.viewModel.choose(card: card)
                    }
                }
            }
            .foregroundColor(viewModel.selectedTheme.color)
        }.navigationBarTitle(Text(viewModel.selectedTheme.name))
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: Angle.degrees(0 - 90),
                        endAngle: Angle.degrees(110 - 90))
                        .padding(5)
                        .opacity(0.4)
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
    }

    // MARK: - Drawing constants
    let fontScaleFactor: CGFloat = 0.5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = EmojiMemoryGame(theme: ThemeStore().random(), themeStore: ThemeStore())
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
