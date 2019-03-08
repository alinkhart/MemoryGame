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
    }
    
    func start(animated: Bool) {
        presenter.viewControllers = [lobbyViewController]
    }
}