//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Эльдар Попов on 11.02.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    @IBAction func chooseTheme(_ sender: Any) {
        performSegue(withIdentifier: "Choose Theme", sender: sender)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }

    @available(iOS 14.0, *)
    func splitViewController(
             _ splitViewController: UISplitViewController,
             collapseSecondary secondaryViewController: UIViewController,
             onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
    
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
