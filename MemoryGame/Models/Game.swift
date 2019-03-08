//
//  Game.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

class Game {
    
    var columns: Int
    var rows: Int
    var cards: [Card]?
    
    private var cardNames = ["Bat", "Cat", "Cow", "Dragon", "GarbageMan", "GhostDog", "Hen", "Horse", "Pig", "Spider"]
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
    }
}
