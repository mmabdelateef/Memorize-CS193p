//
//  Array+Only.swift
//  Memorize
//
//  Created by Mostafa Abdellateef on 12/08/2020.
//  Copyright © 2020 Mostafa Abdellateef. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
