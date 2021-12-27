//
//  Int+random.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 01.06.2021.
//

import Foundation
import UIKit

extension Int {
    var random: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}

extension CGFloat {
    var random: CGFloat {
        if self > 0 {
            return CGFloat.random(in: 0..<self)
        } else if self < 0 {
            return CGFloat.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}
