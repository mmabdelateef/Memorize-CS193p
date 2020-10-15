//
//  EditThemeView.swift
//  Memorize
//
//  Created by Jeffrey Blagdon on 2020-10-14.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

extension String: Identifiable {
    public var id: String {
        return self
    }
}

struct EditThemeView: View {
    @State var theme: Theme
    @ObservedObject var themeStore: ThemeStore
    @State var emojiForDeletion: String? = nil
    @Binding var isPresented: Bool

    init(theme: Theme, isPresented: Binding<Bool>, viewModel: ThemeStore) {
        _theme = State(initialValue: theme)
        _isPresented = isPresented
        self.themeStore = viewModel
    }

    var body: some View {
        Button("Done") {
            self.themeStore.replaceThemeWith(theme)
            self.isPresented = false
        }
        Form {
            Text("Edit a Theme")
            Section {
                TextField("", text: $theme.name)
                LazyVGrid(columns: gridColumns, content: {
                    ForEach.init(theme.emojis, id: \.self) { (emoji) in
                        Text(emoji).font(.largeTitle)
                            .onLongPressGesture {
                            emojiForDeletion = emoji
                        }
                    }
                })
                .alert(item: $emojiForDeletion) { (emoji) -> Alert in
                    return Alert(
                        title: Text("Remove emoji?"),
                        message: Text("Do you want to remove \(emoji) from \(theme.name)?"),
                        primaryButton: Alert.Button.destructive(
                            Text("OK"),
                            action: { self.theme.emojis.removeAll(where: { $0 == emoji }) }),
                        secondaryButton: Alert.Button.cancel()
                    )
                }
            }

            Section {
                Text("Add emojis")
                LazyVGrid(columns: gridColumns, content: {
                    ForEach.init(ThemeStore.someEmojis.filter { !self.doesThemeContain($0) }, id: \.self) { (emoji) in
                        Text(emoji)
                            .font(.largeTitle)
                            .onTapGesture {
                                if !self.theme.emojis.contains(emoji) {
                                    self.theme.emojis.append(emoji)
                                }
                            }
                    }
                })
            }
        }
    }

    func doesThemeContain(_ emoji: String) -> Bool {
        let currentEmojis = Set(theme.emojis)
        return currentEmojis.contains(emoji)
    }

    var gridColumns: [GridItem] {
        [GridItem.init(.fixed(60)), GridItem.init(.fixed(60)), GridItem.init(.fixed(60))]
    }
}

struct AddThemeView: View {
    var body: some View {
        EmptyView()
    }
}
