//
//  ViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 07.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairs: numberOfPairs)
    
    private var numberOfPairs: Int {
        return(cardButtons.count + 1) / 2
    }
    
    private (set) var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    
    
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var emojiChoice: Array <String> = ["😜", "👻", "🎃", "🧠", "🙈", "🤡"]
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("error")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMathched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    private var emojiDictionary = Dictionary<Int, String>()
    
    private func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emojiChoice.count > 0 {
            emojiDictionary[card.identifier] = emojiChoice.remove(at: emojiChoice.count.ar4random)
            }
        return emojiDictionary[card.identifier] ?? "?"
    }
}

extension Int {
    var ar4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
