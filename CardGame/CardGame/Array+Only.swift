//
//  Array+Only.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/11.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
