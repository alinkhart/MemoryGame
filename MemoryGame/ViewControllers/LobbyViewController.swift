//
//  LobbyViewController.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

protocol LobbyViewControllerDelegate: class {
    func startGameButtonTapped(columns: Int, rows: Int)
}

final class LobbyViewController: UIViewController, StoryboardInitializable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func threeByFourButtonTapped(_ sender: Any) {
    }
    
    @IBAction func fiveByTwoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func fourByFourButtonTapped(_ sender: Any) {
    }
    
    @IBAction func fourByFiveButtonTapped(_ sender: Any) {
    }
    
}
