//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 11.02.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifier check
        if segue.identifier == "Choose Theme" {
            // Getting curretTitle like "Cat", "Love", "Weather" etc.
            if let themeName = (sender as? UIButton)?.currentTitle {
                // It's the way to get access in ConcentrationViewController variables and make sets them
                if let cvc = segue.destination as? ConcentrationViewController {
                    var i = 0;
                    while i < cvc.emojiThemes.count {
                        // find theme that equal with our button title
                        if (cvc.emojiThemes[i].name == themeName) {
                            cvc.theme = i
                            break;
                            }
                        i += 1;
                    }
                }
            }
        }
    }
    
}
