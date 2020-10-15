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

    func delete(theme: Theme) {
        themes.removeAll { (theme2) -> Bool in
            theme.id == theme2.id
        }
    }

    static var someEmojis: [String] {
        return (0x1F601...0x1F64F).map { i in
            String(UnicodeScalar(i) ?? "-")
        }
    }

    func add(_ emoji: String, to theme: Theme) {
        guard let index = self.themes.firstIndex(where: { $0.id == theme.id}) else { return }
        guard !themes[index].emojis.contains(emoji) else { return }
        themes[index].emojis.append(emoji)
    }

    func remove(_ emoji: String, from theme: Theme) {
        guard let index = self.themes.firstIndex(where: { $0.id == theme.id}) else { return }
        themes[index].emojis.removeAll(where: { $0 == emoji })
    }

    func replaceThemeWith(_ theme: Theme) {
        guard let index = self.themes.firstIndex(where: { $0.id == theme.id}) else { return }
        themes[index] = theme
    }
}
