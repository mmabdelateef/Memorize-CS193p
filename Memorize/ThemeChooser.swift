//
//  ThemeChooser.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 30/09/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct ThemeChooser: View {
    var themes: [Theme]
    var body: some View {
        NavigationView {
            List{
                ForEach(themes) { theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(themes: ThemeStore.themes)),
                        label: { Text(theme.name) }
                    )
                }
            }
        }
    }
}

struct ThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChooser(themes: ThemeStore.themes)
    }
}
