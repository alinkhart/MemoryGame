//
//  LobbyCoordinator.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

class LobbyCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private let lobbyViewController: LobbyViewController
    private var gameCoordinator: GameCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.lobbyViewController = LobbyViewController.makeFromStoryboard()
        self.lobbyViewController.delegate = self
    }
    
    func start(animated: Bool) {
        presenter.viewControllers = [lobbyViewController]
    }
}

extension LobbyCoordinator: LobbyViewControllerDelegate {
    
    func startGameButtonTapped(columns: Int, rows: Int) {
        let game = Game(columns: columns, rows: rows)
        
        gameCoordinator = GameCoordinator(presenter: lobbyViewController, game: game)
        gameCoordinator?.start(animated: true)
    }
}
