//
//  Int+RandomValue.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/14.
//

import Foundation

extension Int {
    var randomValue: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
