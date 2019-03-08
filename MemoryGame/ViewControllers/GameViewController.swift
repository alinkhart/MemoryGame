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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewWidthConstraint: NSLayoutConstraint!
    
    weak var delegate: GameViewControllerDelegate?
    
    var game: Game?
    
    let fiveColumnWidth: CGFloat = 350
    let fourColumnWidth: CGFloat = 278
    let threeColumnWidth: CGFloat = 206

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionWidth()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        delegate?.backButtonTapped()
    }
    
    private func setCollectionWidth() {
        switch game?.columns {
        case 5:
            collectionViewWidthConstraint.constant = fiveColumnWidth
            break
        case 4:
            collectionViewWidthConstraint.constant = fourColumnWidth
            break;
        case 3:
            collectionViewWidthConstraint.constant = threeColumnWidth
        default:
            break;
        }
    }
}

extension GameViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game?.cards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        guard let card = game?.cards?[indexPath.row] else { return cell }
        
        cell.cardImageView.image = card.backImage
        
        return cell
    }
}

extension GameViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
