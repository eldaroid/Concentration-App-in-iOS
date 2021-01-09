//
//  Card.swift
//  Concentration
//
//  Created by Эльдар Попов on 08.01.2021.
//

import Foundation

struct Card {

    var isFaceUp = false
    var isMathched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueUdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
     
    init() {
        self.identifier = Card.getUniqueUdentifier()
    }
}
