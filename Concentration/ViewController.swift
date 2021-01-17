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
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game.setNewGame()
        indexTheme = emojiThemes.count.ar4random
        sender.setTitleColor(backgroundColor, for: UIControl.State.normal)
        sender.backgroundColor = cardBackgroundColor
        updateViewFromModel()
}

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("error")
        }
    }

    @IBOutlet weak var titleLable: UILabel!
    
    private struct Theme {
        var name: String
        var emojis: [String]
        var viewColor: UIColor
        var cardColor: UIColor
    }
    
    private var backgroundColor = UIColor.black
    private var cardBackgroundColor = UIColor.orange
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMathched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : cardBackgroundColor
            }
            flipCountLabel.text = "Flips: \(game.flipCount)"
            scoreLabel.text = "Score: \(game.score)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        indexTheme = emojiThemes.count.ar4random
        updateViewFromModel()
    }
    
    private var indexTheme = 0 {
        didSet {
            titleLable.text = emojiThemes[indexTheme].name
            emojiDictionary = [Int: String]()
            
            emojiChoice = emojiThemes[indexTheme].emojis
            backgroundColor = emojiThemes[indexTheme].viewColor
            cardBackgroundColor = emojiThemes[indexTheme].cardColor
            
            updateAppearance()
        }
    }
    
    private func updateAppearance() {
        view.backgroundColor = backgroundColor
        flipCountLabel.textColor = cardBackgroundColor
        scoreLabel.textColor = cardBackgroundColor
        titleLable.textColor = cardBackgroundColor
    }
    
    private var emojiChoice: Array <String> = ["😜", "👻", "🎃", "🧠", "🙈", "🤡", "💦", "🍎", "🌧"]

//    private var keys: [String] { return Array(emojiThemes.keys) }

    
    private var emojiThemes: [Theme] =
        [Theme(name: "Love",
               emojis: ["💛", "💙", "💜", "❤️", "💚", "💔", "💓", "💗", "💕", "💞", "💘", "💖"],
               viewColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),
               cardColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
         Theme(name: "Emoji",
               emojis: ["😄", "😆", "😊", "😃", "☺️", "😏", "😍", "😘", "😚", "😳", "😌", "😆"],
               viewColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),
               cardColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
         Theme(name: "Cat",
               emojis: ["😺", "😸", "😻", "😽", "😼", "🙀", "😿", "😹", "😾", "👹"],
               viewColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
               cardColor: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)),
         Theme(name: "Family",
               emojis: ["👦", "👧", "👩", "👨", "👶", "👵", "👴", "🙋", "👰"],
               viewColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),
               cardColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
         Theme(name: "Weather",
               emojis: ["☀️", "☔", "☁️", "❄️", "⛄", "⚡", "🌀", "🌁", "🌊"],
               viewColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
               cardColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
         Theme(name: "Fruits",
               emojis: ["🍎", "🍏", "🍊", "🍋", "🍒", "🍇", "🍉", "🍓", "🍑", "🍈", "🍌", "🍐"],
               viewColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
               cardColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        ]
    
    //emoji in Stanford course
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

extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: diff.ar4random)
            swapAt(i, j)
        }
    }
}
