//
//  ThemeChooser.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 30/09/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct ThemeChooser: View {

    @ObservedObject
    var themeStore: ThemeStore

    @State private var isAddThemePresented = false
    @State private var themeTitle: String = ""
    @State private var themeEmojis: String = ""
    @State private var color = Color.red

    var body: some View {
        NavigationView {
            List{
                ForEach(themeStore.themes) { theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme, themeStore: themeStore)),
                        label: { Text(theme.name) }
                    )
                }
            }
            .sheet(isPresented: $isAddThemePresented, content: {
                Form {
                    Text("Add a Theme")
                    Section {

                        TextField("", text: $themeTitle)
                        TextField("emojis", text: $themeEmojis).keyboardType(.alphabet)
                        if #available(iOS 14.0, *) {
                            ColorPicker("color", selection: $color)
                        }

                    }

                    Button("Add") {
                        themeStore.add(theme: Theme(name: themeTitle, emojis: themeEmojis.map(String.init), color: color))
                    }
                    

                }
            })
            .navigationBarItems(trailing:
                                    Button("Add") {
                                        isAddThemePresented = true
                                    }
                                )
        }
    }
}

//struct ThemeChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser(theme: ThemeStore().theme, themeStore: ThemeStore())
//    }
//}
