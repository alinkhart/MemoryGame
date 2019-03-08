//
//  AppCoordinator.swift
//  MemoryGame
//
//  Created by alinkhart on 3/8/19.
//  Copyright © 2019 Adam Linkhart, LLC. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private let lobbyCoordinator: LobbyCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.window.rootViewController = self.rootViewController
        self.lobbyCoordinator = LobbyCoordinator(presenter: self.rootViewController)
    }
    
    func start(animated: Bool) {
        window.makeKeyAndVisible()
        lobbyCoordinator.start(animated: animated)
    }
}
