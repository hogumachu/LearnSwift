//
//  ViewController.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/09.
//

import UIKit

class CardGameViewController: UIViewController {
    private lazy var game = CardGame(numberOfPairsOfCards: numberOfPairsOfCards)
    var cards: [UIButton] = []
    private let flipCountLabel = UILabel()
    private let newGameButton = UIButton()
    private let firstStackView = UIStackView()
    private let secondStackView = UIStackView()
    private let thirdStackView = UIStackView()
    private let lastStackView = UIStackView()
    private let sumStackView = UIStackView()
    private(set) var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    var numberOfPairsOfCards: Int { (cards.count + 1) / 2 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
    }
    
    func settingView() {
        settingCard()
        addViews()
        drawingView()
    }
    
    @objc func touchUpCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cards.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @objc func touchUpNewGame(_ sender: UIButton) {
        cardEmoji = ["🦇","😱","🙀","👿","🎃","👻","🍭","🍬","🍎","🙉","🦊","🐲"]
        flipCount = 0
        self.game = CardGame(numberOfPairsOfCards: (cards.count + 1) / 2)
        updateViewFromModel()
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
    var theme: [String]? {
        didSet {
            cardEmoji = theme ?? [""]
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    // MARK: - Card Emoji
    private var cardEmoji = ["🦇","😱","🙀","👿","🎃","👻","🍭","🍬","🍎","🙉","🦊","🐲"]
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, cardEmoji.count > 0 {
            emoji[card] = cardEmoji.remove(at: (cardEmoji.count.randomValue))
        }
        return emoji[card] ?? "?"
    }
    

    
    // MARK: - Drawing View, Setting Card
    
    func settingCard() {
        for _ in 1...16 {
            let card = UIButton()
            card.cardSetting(title: "", backgroundColor: .orange, view: view)
            cards.append(card)
        }
    }
    
    func addViews() {
        for card in cards {
            view.addSubview(card)
            card.addTarget(self, action: #selector(touchUpCard), for: .touchUpInside)
        }
        view.addSubview(flipCountLabel)
        view.addSubview(newGameButton)
        view.addSubview(firstStackView)
        view.addSubview(secondStackView)
        view.addSubview(thirdStackView)
        view.addSubview(sumStackView)
        
        // newGameButton Action
        newGameButton.addTarget(self, action: #selector(touchUpNewGame), for: .touchUpInside)
    }
    
    func drawingView() {
        view.backgroundColor = .black
        flipCountLabel.text = "Flips: 0"
        flipCountLabel.textColor = .white
        flipCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.setTitleColor(.white, for: .normal)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.axis = .horizontal
        firstStackView.alignment = .center
        firstStackView.distribution = .fillEqually
        firstStackView.spacing = 8
        firstStackView.addArrangedSubview(cards[0])
        firstStackView.addArrangedSubview(cards[1])
        firstStackView.addArrangedSubview(cards[2])
        firstStackView.addArrangedSubview(cards[3])
        
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.axis = .horizontal
        secondStackView.alignment = .center
        secondStackView.distribution = .fillEqually
        secondStackView.spacing = 8
        secondStackView.addArrangedSubview(cards[4])
        secondStackView.addArrangedSubview(cards[5])
        secondStackView.addArrangedSubview(cards[6])
        secondStackView.addArrangedSubview(cards[7])
        
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.axis = .horizontal
        thirdStackView.alignment = .center
        thirdStackView.distribution = .fillEqually
        thirdStackView.spacing = 8
        thirdStackView.addArrangedSubview(cards[8])
        thirdStackView.addArrangedSubview(cards[9])
        thirdStackView.addArrangedSubview(cards[10])
        thirdStackView.addArrangedSubview(cards[11])
        
        lastStackView.translatesAutoresizingMaskIntoConstraints = false
        lastStackView.axis = .horizontal
        lastStackView.alignment = .center
        lastStackView.distribution = .fillEqually
        lastStackView.spacing = 8
        lastStackView.addArrangedSubview(cards[12])
        lastStackView.addArrangedSubview(cards[13])
        lastStackView.addArrangedSubview(cards[14])
        lastStackView.addArrangedSubview(cards[15])
        
        sumStackView.translatesAutoresizingMaskIntoConstraints = false
        sumStackView.axis = .vertical
        sumStackView.alignment = .center
        sumStackView.distribution = .fillEqually
        sumStackView.spacing = 8
        sumStackView.addArrangedSubview(firstStackView)
        sumStackView.addArrangedSubview(secondStackView)
        sumStackView.addArrangedSubview(thirdStackView)
        sumStackView.addArrangedSubview(lastStackView)
        
        NSLayoutConstraint.activate([
            flipCountLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 5),
            flipCountLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 5),
            flipCountLabel.heightAnchor.constraint(equalToConstant: 50),
            flipCountLabel.widthAnchor.constraint(equalToConstant: 100),
            
            newGameButton.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 5),
            newGameButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 5),
            newGameButton.heightAnchor.constraint(equalTo: flipCountLabel.heightAnchor),
            newGameButton.widthAnchor.constraint(equalTo: flipCountLabel.widthAnchor),
            
            sumStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            sumStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 5),
            sumStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
            sumStackView.bottomAnchor.constraint(equalTo: flipCountLabel.topAnchor, constant: 5)
            
        ])
    }
}

