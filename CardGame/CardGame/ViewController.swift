//
//  ViewController.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/09.
//

import UIKit

class ViewController: UIViewController {
    
    var cards: [UIButton] = []
    let flipCountLabel = UILabel()
    let cardEmoji = ["👻", "🎃", "👻", "🎃"]
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView(view: view)
    }
    
    func settingView(view: UIView) {
        for emoji in cardEmoji {
            let card = UIButton()
            card.cardSetting(title: emoji, backgroundColor: .white, view: view)
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
            
            cards[0].centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 100),
            cards[0].centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 250),
            
            cards[1].centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -100),
            cards[1].centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 250),
            
            cards[2].centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 100),
            cards[2].centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -250),
            
            cards[3].centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -100),
            cards[3].centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -250),
        ])
    }
    
    
    @objc func touchUpCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cards.firstIndex(of: sender) {
            flipCard(withEmoji: cardEmoji[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else if button.currentTitle == "" {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
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
