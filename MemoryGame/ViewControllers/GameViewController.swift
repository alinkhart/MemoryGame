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
        return game?.cards.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        guard let card = game?.cards[indexPath.row] else { return cell }
        
        cell.cardImageView.image = card.backImage
        
        return cell
    }
}

extension GameViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        guard let card = game?.cards[indexPath.row], !card.isFlipped else { return }
        
        cell.cardImageView.image = card.frontImage
        card.isFlipped = true
        
        game?.cardsShown.append(card)
    }
}

extension GameViewController: GameDelegate {
    
    func resetCardsUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            guard let cards = self.game?.cards else { return }
            
            for (index, card) in cards.enumerated() {
                if card.isFlipped && !card.isMatched {
                    card.isFlipped = false
                    let cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! CardCollectionViewCell
                    cell.cardImageView.image = UIImage(named: "CardBack")!
                }
            }
        }
    }
}
