//
//  Concentration.swift
//  Concentration
//
//  Created by Эльдар Попов on 08.01.2021.
//

import Foundation

class Concentration
{
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        if !cards[index].isMathched {
            if let matchedIndex = indexOfOneAndOnlyFacedUpCard, matchedIndex != index {
                // check if cards match
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMathched = true
                    cards[index].isMathched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
    }
}

