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
    
    // MARK: - Shared Singleton
    class State {
        static var isStudyMode = true
        static var correctGuesses = 0
        static var totalGuesses = 0
        static var namesArr: [String] = ["A", "B", "C", "D"]
    }
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var correctGuesses: UILabel!
    @IBOutlet weak var totalGuesses: UILabel!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var sidebarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    // MARK: - Actions
    @IBAction func toggleStudy(_ sender: Any) {
        State.isStudyMode = !State.isStudyMode
    
        collectionView.layoutIfNeeded()
        
        if sidebarWidthConstraint.constant > 0 {
            sidebarWidthConstraint.constant = 0
        } else {
            sidebarWidthConstraint.constant = 240
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.view.layoutIfNeeded()
        })
        
        toggleReset()
    
    }
    
    @IBAction func resetState(_ sender: Any) {
        State.correctGuesses = 0
        State.totalGuesses = 0
        correctGuesses.text = "0"
        totalGuesses.text = "0"
    }
    
    private func toggleButtons(temple: TempleCard) {
        let correctIndex = Int.random(in: 0...3)
        for i in 0...3 {
             State.namesArr[i] = cards[Int.random(in: 0..<cards.count)].name
        }
        print("correct index at:")
        print(correctIndex)
        print(State.namesArr)
        State.namesArr[correctIndex] = temple.name
        button1.setTitle(State.namesArr[0], for: .normal)
        button2.setTitle(State.namesArr[1], for: .normal)
        button3.setTitle(State.namesArr[2], for: .normal)
        button4.setTitle(State.namesArr[3], for: .normal)
    }
    
    private func toggleReset() {
        if resetButton.isEnabled == true {
            resetButton.isEnabled = false
        } else {
            resetButton.isEnabled = true
        }
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
            print(templeCardCell)
            let temple = cards[indexPath.row]
            toggleButtons(temple: temple)
            guard let templeImage = UIImage(named: temple.filename) else {
                return
            }
            selectedImage.image = templeImage
        }
    }
}

//extension TempleCardsViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // if cellHeight = 100 then cellWidth = imageWidth/imageHeight * 100
//    }
//}
