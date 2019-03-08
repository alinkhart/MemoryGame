//
//  GameCoordinator.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

class GameCoordinator: Coordinator {
    
    private let presenter: UIViewController
    private let gameViewController: GameViewController
    
    init(presenter: UIViewController) {
        self.presenter = presenter
        self.gameViewController = GameViewController.makeFromStoryboard()
        self.gameViewController.delegate = self
    }
    
    func start(animated: Bool) {
        presenter.show(gameViewController, sender: self)
    }
}

extension GameCoordinator: GameViewControllerDelegate {
    
    func backButtonTapped() {
        presenter.navigationController?.popViewController(animated: true)
    }
}
