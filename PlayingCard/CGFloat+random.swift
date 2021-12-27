//
//  CGFloat+random.swift
//  PlayingCard
//
//  Created by Sergey Lukaschuk on 27.12.2021.
//

import Foundation
import UIKit

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
