//
//  TempleCardsViewController.swift
//  TempleFlashcards
//
//  Created by Kyle Gill on 10/11/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

class TempleCardsViewController : UIViewController {
    
    // MARK: - Constants
    private struct Storyboard {
        static let TempleCardCellIdentifier = "TempleCardCell"
    }
    
    // MARK: - Properties
    private var cards = TempleDeck()
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Actions
    @IBAction func show(_ sender: Any) {
        collectionView.reloadData()
        print("should reload")
    }
}

// MARK: - Collection view data source
extension TempleCardsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.TempleCardCellIdentifier,
                                                      for: indexPath)
        
        if let templeCardCell = cell as? TempleCardCell {
            templeCardCell.templeCardView.card = cards[indexPath.row]
            templeCardCell.templeCardView.setNeedsDisplay()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
}

// MARK: - Collection view delegate
extension TempleCardsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let templeCardCell = collectionView.cellForItem(at: indexPath) as? TempleCardCell {
            print(cards[indexPath.row])
            print(templeCardCell)
        }
    }
}

//extension TempleCardsViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // if cellHeight = 100 then cellWidth = imageWidth/imageHeight * 100
//    }
//}
