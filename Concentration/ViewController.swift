//
//  ViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 07.01.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy  var game: Concentration = Concentration(numberOfPairs: (cardButtons.count / 2))
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoice: Array <String> = ["😜", "👻", "🎃", "🧠", "🙈", "🤡"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("error")
        }
    }
    
    func updateViewFromModel() {
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
    
    var emojiDictionary = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emojiChoice.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emojiDictionary[card.identifier] = emojiChoice.remove(at: randomIndex)
            }
        if emojiDictionary[card.identifier] != nil {
             return emojiDictionary[card.identifier]!
        } else {
            return "?"
        }
    }

    func flipCard(withEmoji Emoji: String, on button: UIButton) {
        print("\(Emoji)")
        if button.currentTitle == Emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(Emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

