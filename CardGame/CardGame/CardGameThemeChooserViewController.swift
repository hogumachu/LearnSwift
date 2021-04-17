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
    private let backgroundView = UIImageView(image: UIImage(named: "cardImage.png"))
    
    let themes = [
        "Halloween": ["🦇","😱","🙀","👿","🎃","👻","🍭","🍬"],
        "Sports": ["⚽️","🏀", "🏈","⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓"],
        "Animals": ["🐶", "🐹", "🐻", "🐯", "🐷", "🐥", "🦄", "🐟", "🦀", "🐲"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // MARK: - Drawing View
    
    func settingView() {
        self.navigationItem.title = "Card Game"
        self.navigationController?.navigationBar.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(themeStackView)
        
        themeStackView.translatesAutoresizingMaskIntoConstraints = false
        themeStackView.axis = .vertical
        themeStackView.alignment = .center
        themeStackView.distribution = .fillEqually
        themeStackView.spacing = 12
        themeStackView.addArrangedSubview(halloweenButton)
        themeStackView.addArrangedSubview(sportsButton)
        themeStackView.addArrangedSubview(animalsButton)
        
        halloweenButton.setTitle("Halloween", for: .normal)
        halloweenButton.titleLabel?.font = .boldSystemFont(ofSize: 40)
        halloweenButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        halloweenButton.layer.cornerRadius = 10
        
        sportsButton.setTitle("Sports", for: .normal)
        sportsButton.titleLabel?.font = .boldSystemFont(ofSize: 40)
        sportsButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        sportsButton.layer.cornerRadius = 10
        
        animalsButton.setTitle("Animals", for: .normal)
        animalsButton.titleLabel?.font = .boldSystemFont(ofSize: 40)
        animalsButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        animalsButton.layer.cornerRadius = 10
        
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.opacity = 0.5
        
        NSLayoutConstraint.activate([
            themeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalToConstant: view.frame.width),
            backgroundView.heightAnchor.constraint(equalToConstant: view.frame.width)
        ])
        
        halloweenButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
        sportsButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
        animalsButton.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
    }
    
    
}
