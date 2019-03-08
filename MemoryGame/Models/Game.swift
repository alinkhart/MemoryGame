//
//  Game.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

protocol GameDelegate: class {
    func resetCardsUI()
}

class Game {
    
    weak var delegate: GameDelegate?
    
    var columns: Int
    var rows: Int
    var cards = [Card]()
    var cardsShown = [Card]() {
        didSet {
            if cardsShown.count == 2 && cardsShown[0].matches(card: cardsShown[1]){
                cardsShown[0].isMatched = true
                cardsShown[1].isMatched = true
                cardsShown.removeAll()
            } else if cardsShown.count == 2 {
                delegate?.resetCardsUI()
                self.cardsShown.removeAll()
                
            }
        }
    }
    
    private var cardNames = ["Bat", "Cat", "Cow", "Dragon", "GarbageMan", "GhostDog", "Hen", "Horse", "Pig", "Spider"]
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        self.cards = createCards(numberOfCards: columns * rows)
    }
    
    private func createCards(numberOfCards: Int) -> [Card] {
        let distinctCardNumber = numberOfCards / 2
        var tempCards = [Card]()
        
        removeRandomCards(numberToRemove: distinctCardNumber)
        
        for cardName in cardNames {
            guard let cardFrontImate = UIImage(named: "\(cardName)CardFront") else { continue }
            
            let card1 = Card(name: cardName, frontImage: cardFrontImate)
            let card2 = Card(name: cardName, frontImage: cardFrontImate)
            tempCards.append(card1)
            tempCards.append(card2)
        }
        
        tempCards.shuffle()
        
        return tempCards
    }
    
    private func removeRandomCards(numberToRemove: Int) {
        for _ in 0..<cardNames.count - numberToRemove {
            cardNames.remove(at: Int.random(in: 0..<cardNames.count - 1))
        }
    }
}
