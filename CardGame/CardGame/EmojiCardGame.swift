//
//  EmojiCardGame.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/11.
//

// ViewModel

import UIKit
import Combine

class EmojiCardGame: ObservableObject {
    @Publisher private var model: CardGame<String> = EmojiCardGame.createCardGame()
    
    private static func createCardGame() -> CardGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "🍬"]
        
        return CardGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<CardGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: CardGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiCardGame.createCardGame()
    }
}
