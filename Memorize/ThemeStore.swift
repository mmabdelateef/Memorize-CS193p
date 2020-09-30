//
//  ThemeStore.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 30/09/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

class ThemeStore {
    static let themes: [Theme] = [
    Theme(name: "Smilies", emojis: ["🧐", "🤪", "🤨", "😳", "😬", "🤗", "🥱"], color: Color.yellow),
    Theme(name: "Sea", emojis: ["🐙", "🐳", "🦑", "🦐", "🦈", "🦀", "🐠", "🐡"], color: Color.blue),
    Theme(name: "Animals", emojis: ["🦒", "🦏", "🐫", "🦓", "🐆", "🐅", "🐘", "🦍", "🐃"], color: Color.black),
    Theme(name: "Plants", emojis: ["🌲", "🌾", "🌴", "🌳", "🍀", "🌵", "🎋", "🌿"], color: Color.green),
    ]
}
