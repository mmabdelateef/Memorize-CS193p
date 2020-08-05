//
//  ContentView.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 03/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { idx in
                CardView(isFaceUp: idx % 2 == 0)
            }
        }
        .foregroundColor(.orange)
        .padding()
        .font(.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack { // combiner view
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
