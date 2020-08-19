//
//  Cardify.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 20/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3

    var isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Pie(startAngle: Angle.degrees(0 - 90),
                    endAngle: Angle.degrees(110 - 90))
                    .padding(5)
                    .opacity(0.4)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
}
