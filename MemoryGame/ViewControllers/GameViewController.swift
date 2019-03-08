//
//  GameViewController.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func backButtonTapped()
}

final class GameViewController: UIViewController, StoryboardInitializable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
    }
}
