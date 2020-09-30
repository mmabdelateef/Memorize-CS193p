//
//  ThemeStore.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 30/09/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

class ThemeStore: ObservableObject {

    @Published
    private(set) var themes: [Theme] = [
    Theme(name: "Smilies", emojis: ["🧐", "🤪", "🤨", "😳", "😬", "🤗", "🥱"], color: Color.yellow),
    Theme(name: "Sea", emojis: ["🐙", "🐳", "🦑", "🦐", "🦈", "🦀", "🐠", "🐡"], color: Color.blue),
    Theme(name: "Animals", emojis: ["🦒", "🦏", "🐫", "🦓", "🐆", "🐅", "🐘", "🦍", "🐃"], color: Color.black),
//    Theme(name: "Plants", emojis: ["🌲", "🌾", "🌴", "🌳", "🍀", "🌵", "🎋", "🌿"], color: Color.green),
    ]

    func random() -> Theme {
        themes.randomElement()!
    }

    func add(theme: Theme) {
        themes.append(theme)
    }
}
