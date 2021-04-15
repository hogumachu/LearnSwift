//
//  UIButton+Card.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/14.
//

import UIKit

extension UIButton {
    func cardSetting(title: String, backgroundColor: UIColor, view: UIView) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 40)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: .greatestFiniteMagnitude),
            self.widthAnchor.constraint(equalToConstant: .greatestFiniteMagnitude)
        ])
    }
}

struct Card: Hashable {
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
