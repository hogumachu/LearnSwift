//
//  ViewController.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/09.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = CardGame(numberOfPairsOfCards: (cards.count + 1) / 2)
    var cards: [UIButton] = []
    let flipCountLabel = UILabel()
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
    }
    
    func settingView() {
        for _ in 1...16 {
            let card = UIButton()
            card.cardSetting(title: "", backgroundColor: .orange, view: view)
            cards.append(card)
        }
        
        for card in cards {
            view.addSubview(card)
            card.addTarget(self, action: #selector(touchUpCard), for: .touchUpInside)
        }
        
        view.addSubview(flipCountLabel)
        view.backgroundColor = .black
        
        flipCountLabel.text = "Flips: 0"
        flipCountLabel.textColor = .white
        flipCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flipCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flipCountLabel.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            flipCountLabel.heightAnchor.constraint(equalToConstant: 50),
            flipCountLabel.widthAnchor.constraint(equalToConstant: 100),
            
            cards[0].leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            cards[0].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            cards[1].leftAnchor.constraint(equalTo: cards[0].rightAnchor, constant: 5),
            cards[1].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            cards[2].leftAnchor.constraint(equalTo: cards[1].rightAnchor, constant: 5),
            cards[2].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            cards[3].leftAnchor.constraint(equalTo: cards[2].rightAnchor, constant: 5),
            cards[3].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            
            cards[4].leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            cards[4].topAnchor.constraint(equalTo: cards[0].bottomAnchor, constant: 5),
            cards[5].leftAnchor.constraint(equalTo: cards[4].rightAnchor, constant: 5),
            cards[5].topAnchor.constraint(equalTo: cards[0].bottomAnchor, constant: 5),
            cards[6].leftAnchor.constraint(equalTo: cards[5].rightAnchor, constant: 5),
            cards[6].topAnchor.constraint(equalTo: cards[0].bottomAnchor, constant: 5),
            cards[7].leftAnchor.constraint(equalTo: cards[6].rightAnchor, constant: 5),
            cards[7].topAnchor.constraint(equalTo: cards[0].bottomAnchor, constant: 5),
            
            cards[8].leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            cards[8].topAnchor.constraint(equalTo: cards[4].bottomAnchor, constant: 5),
            cards[9].leftAnchor.constraint(equalTo: cards[8].rightAnchor, constant: 5),
            cards[9].topAnchor.constraint(equalTo: cards[4].bottomAnchor, constant: 5),
            cards[10].leftAnchor.constraint(equalTo: cards[9].rightAnchor, constant: 5),
            cards[10].topAnchor.constraint(equalTo: cards[4].bottomAnchor, constant: 5),
            cards[11].leftAnchor.constraint(equalTo: cards[10].rightAnchor, constant: 5),
            cards[11].topAnchor.constraint(equalTo: cards[4].bottomAnchor, constant: 5),
            
            cards[12].leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            cards[12].topAnchor.constraint(equalTo: cards[8].bottomAnchor, constant: 5),
            cards[13].leftAnchor.constraint(equalTo: cards[12].rightAnchor, constant: 5),
            cards[13].topAnchor.constraint(equalTo: cards[8].bottomAnchor, constant: 5),
            cards[14].leftAnchor.constraint(equalTo: cards[13].rightAnchor, constant: 5),
            cards[14].topAnchor.constraint(equalTo: cards[8].bottomAnchor, constant: 5),
            cards[15].leftAnchor.constraint(equalTo: cards[14].rightAnchor, constant: 5),
            cards[15].topAnchor.constraint(equalTo: cards[8].bottomAnchor, constant: 5),
            
        ])
    }
    
    @objc func touchUpCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cards.firstIndex(of: sender) {
            print(cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    // MARK: - Card Emoji
    var cardEmoji = ["🦇","😱","🙀","👿","🎃","👻","🍭","🍬","🍎","🙉","🦊","🐲"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, cardEmoji.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cardEmoji.count)))
            emoji[card.identifier] = cardEmoji.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}


// MARK: - cardSetting

extension UIButton {
    func cardSetting(title: String, backgroundColor: UIColor, view: UIView) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 40)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 150),
            self.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}
