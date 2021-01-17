//
//  Concentration.swift
//  Concentration
//
//  Created by Эльдар Попов on 08.01.2021.
//

import Foundation

class Concentration
{
    private (set) var cards = Array<Card>()
    
    private struct Points {
        static let matchBonuses = 2
        static let missBonuses = 1
    }
    
    private (set) var score = 0
    
    private var seenCard: Set<Int> = []
    
    private (set) var flipCount = 0
    
    private var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            var foundIndex: Int?
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        if foundIndex == nil {
                            foundIndex = index
                        } else {
                            return nil
                        }
                    }
                }
            return foundIndex
        }
        set (newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index)
            }
            
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index))")
        if !cards[index].isMathched {
            flipCount += 1
            if let matchedIndex = indexOfOneAndOnlyFacedUpCard, matchedIndex != index {
                // check if cards match
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMathched = true
                    cards[index].isMathched = true
                    score += Points.matchBonuses
                } else {
                    if seenCard.contains(index) {
                        score -= Points.missBonuses
                    }
                    if seenCard.contains(matchedIndex) {
                        score -= Points.missBonuses
                    }
                    seenCard.insert(index)
                    seenCard.insert(matchedIndex)
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "Concentration.init(at: \(numberOfPairs))")
        for _ in 1...numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func setNewGame() {
        score = 0
        flipCount = 0
        seenCard = []
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMathched = false
        }
        cards.shuffle()
    }
}
