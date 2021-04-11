//
//  Array+Identifiable.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/11.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
