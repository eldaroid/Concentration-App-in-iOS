//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 11.02.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    private struct Theme {
        var name: String
        var emojis: [String]
        var viewColor: UIColor
        var cardColor: UIColor
    }
    
    private var emojiThemes: [Theme] =
        [Theme(name: "Love",
               emojis: ["💛", "💙", "💜", "❤️", "💚", "💔", "💓", "💗", "💕", "💞", "💘", "💖"],
               viewColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),
               cardColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
         Theme(name: "Emoji",
               emojis: ["😄", "😆", "😊", "😃", "☺️", "😏", "😍", "😘", "😚", "😳", "😌", "😆"],
               viewColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),
               cardColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
         Theme(name: "Cats",
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle {
                var i = 0;
                while i < emojiThemes.count {
                    if (emojiThemes[i].name == themeName) {
                        let theme = emojiThemes[i].emojis
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.theme = i
                        }
                        break
                    }
                    i += 1;
                }
            }
        }
    }

}
