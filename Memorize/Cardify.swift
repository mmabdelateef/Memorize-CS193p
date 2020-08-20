//
//  Cardify.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 20/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3

    private var rotation: Double
    private var isFaceUp: Bool {
        rotation < 90
    }

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        .padding(4)
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (0, 1, 0)
        )
    }
}
