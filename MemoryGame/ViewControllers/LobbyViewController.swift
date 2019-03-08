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
    
    weak var delegate: LobbyViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func threeByFourButtonTapped(_ sender: Any) {
        delegate?.startGameButtonTapped(columns: 3, rows: 4)
    }
    
    @IBAction func fiveByTwoButtonTapped(_ sender: Any) {
        delegate?.startGameButtonTapped(columns: 5, rows: 2)
    }
    
    @IBAction func fourByFourButtonTapped(_ sender: Any) {
        delegate?.startGameButtonTapped(columns: 4, rows: 4)
    }
    
    @IBAction func fourByFiveButtonTapped(_ sender: Any) {
        delegate?.startGameButtonTapped(columns: 4, rows: 5)
    }
}
