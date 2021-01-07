//
//  ViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 07.01.2021.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoice: Array <String> = ["🧠", "👻", "🤡", "😜", "👻", "🎃", "🧠", "😜", "🙈", "🎃", "🤡", "🙈"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("error")
        }
//        flipCard(withEmoji: "🎃", on: send er)
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

