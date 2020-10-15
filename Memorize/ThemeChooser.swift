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


    @State private var themeTitle: String = ""
    @State private var themeEmojis: String = ""
    @State private var color = Color.red
    @State private var editMode: EditMode = .inactive
    @State private var presentation: PresentationMode? = nil

    enum PresentationMode: Identifiable {
        var id: String {
            switch self {
            case .add: return "aadd"
            case let .edit(theme):
                return theme.id.uuidString
            }
        }

        case add
        case edit(Theme)
    }

    var body: some View {
        NavigationView {
            Form {
                ForEach(themeStore.themes) { theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme, themeStore: themeStore))
                    ) {
                        Text(theme.name).onTapGesture {
                            if editMode.isEditing {
                                presentation = .edit(theme)
                            }
                        }
                    }
                }.onDelete { indexSet in
                    indexSet.forEach { (index) in
                        themeStore.delete(theme: themeStore.themes[index])
                    }
                }
            }

            .sheet(item: $presentation, content: { item in
                switch item {
                case .add:
                    AddThemeView()
                case let .edit(theme):
                    EditThemeView(theme: theme, isPresented: Binding(
                                    get: {
                                        if case .edit = self.presentation {
                                            return true
                                        } else {
                                            return false
                                        }
                                    },
                                    set: { (newVal) in
                        if newVal {
                            self.presentation = .edit(theme)
                        } else {
                            self.presentation = nil
                        }
                    }), viewModel: self.themeStore)
                }
            })
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button("Add") {
                                        presentation = .add
                                    }
                                )
            .environment(\.editMode, $editMode)
        }
    }
}

//struct ThemeChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser(theme: ThemeStore().theme, themeStore: ThemeStore())
//    }
//}
