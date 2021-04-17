//
//  CardGameThemeChooserViewController.swift
//  CardGame
//
//  Created by 홍성준 on 2021/04/17.
//

import UIKit

class CardGameThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    private let halloweenButton = UIButton()
    private let sportsButton = UIButton()
    private let animalsButton = UIButton()
    private let themeStackView = UIStackView()
    
    let themes = [
        "Halloween": ["🦇","😱","🙀","👿","🎃","👻","🍭","🍬"],
        "Sports": ["⚽️","🏀", "🏈","⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓"],
        "Animals": ["🐶", "🐹", "🐻", "🐯", "🐷", "🐥", "🦄", "🐟", "🦀", "🐲"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Card Game"
        self.navigationController?.navigationBar.backgroundColor = .white
        settingView()
    }
    @objc func nextScene(_ sender: UIButton) {
        let nextViewController = CardGameViewController.init()
        if let themeName = sender.currentTitle, let theme = themes[themeName] {
            nextViewController.theme = theme
        }
        nextViewController.navigationItem.title = sender.currentTitle
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func settingView() {
        view.addSubview(themeStackView)
        themeStackView.translatesAutoresizingMaskIntoConstraints = false
        themeStackView.axis = .vertical
        themeStackView.alignment = .center
        themeStackView.distribution = .fillEqually
        themeStackView.spacing = 8
        themeStackView.addArrangedSubview(halloweenButton)
        themeStackView.addArrangedSubview(sportsButton)
        themeStackView.addArrangedSubview(animalsButton)
        
        halloweenButton.setTitle("Halloween", for: .normal)
        halloweenButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        sportsButton.setTitle("Sports", for: .normal)
        sportsButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        animalsButton.setTitle("Animals", for: .normal)
        animalsButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        NSLayoutConstraint.activate([
            themeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        halloweenButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
        sportsButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
        animalsButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
    }
    
    
}
