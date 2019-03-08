//
//  Card.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

class Card {
    
    var name: String
    var frontImage: UIImage
    var isFlipped = false
    var isMatched = false
    let backImage = UIImage(named: "CardBack")
    
    init (name: String, frontImage: UIImage) {
        self.name = name
        self.frontImage = frontImage
    }
    
    func matches(card: Card) -> Bool {
        return name == card.name
    }
}
