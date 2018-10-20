//
//  TempleCardsViewController.swift
//  TempleFlashcards
//
//  Created by Kyle Gill on 10/11/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

class SubclassUIButton : UIButton {
    var value: String?
}

class TempleCardsViewController : UIViewController {
    
    // MARK: - Constants
    private struct Storyboard {
        static let TempleCardCellIdentifier = "TempleCardCell"
    }
    
    // MARK: - Properties
    private var cards = TempleDeck()
    
    // MARK: - Shared Singleton
    class State {
        static var selectedCard: TempleCard = TempleCard(filename: "madrid-spain-temple-954939-mobile.jpg", name: "Madrid Spain")
        static var isStudyMode = true
        static var correctGuesses = 0
        static var totalGuesses = 0
        static var namesArr: [String] = ["A", "B", "C", "D"]
        static var correctNames: Set = [""]
    }
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var correctGuesses: UILabel!
    @IBOutlet weak var totalGuesses: UILabel!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var sidebarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var button1: SubclassUIButton!
    @IBOutlet weak var button2: SubclassUIButton!
    @IBOutlet weak var button3: SubclassUIButton!
    @IBOutlet weak var button4: SubclassUIButton!
    
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var toggleStudyButton: UIBarButtonItem!
    
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
        if State.isStudyMode == true {
            toggleStudyButton.title = "Study"
        } else {
            toggleStudyButton.title = "Quiz"
        }
        
        toggleReset()
    
    }
    
    @IBAction func resetState(_ sender: Any) {
        State.correctGuesses = 0
        State.totalGuesses = 0
        State.correctNames = [""]
        correctGuesses.text = "0"
        totalGuesses.text = "0"
    }
    @IBAction func button1Press(_ sender: SubclassUIButton) {
        if let name = sender.value {
            checkAnswer(answer: name)
        }
    }
    @IBAction func button2Press(_ sender: SubclassUIButton) {
        if let name = sender.value {
            checkAnswer(answer: name)
        }
    }
    @IBAction func button3Press(_ sender: SubclassUIButton) {
        if let name = sender.value {
            checkAnswer(answer: name)
        }
    }
    @IBAction func button4Press(_ sender: SubclassUIButton) {
        if let name = sender.value {
            checkAnswer(answer: name)
        }
    }
    
    // MARK: - Helper functions
    private func checkAnswer(answer: String) {
        print(answer)
        if State.correctNames.contains(answer) {
            print("Already got that one right!")
            return
        }
        if answer == State.selectedCard.name {
            print("Score!")
            State.correctNames.insert(answer)
            State.correctGuesses = State.correctGuesses + 1
            State.totalGuesses = State.totalGuesses + 1
            correctGuesses.text = String(State.correctGuesses)
            totalGuesses.text = String(State.totalGuesses)
        } else {
            print("Incorrect")
            State.totalGuesses = State.totalGuesses + 1
            totalGuesses.text = String(State.totalGuesses)
        }
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
        button1.value = State.namesArr[0]
        button2.setTitle(State.namesArr[1], for: .normal)
        button2.value = State.namesArr[1]
        button3.setTitle(State.namesArr[2], for: .normal)
        button3.value = State.namesArr[2]
        button4.setTitle(State.namesArr[3], for: .normal)
        button4.value = State.namesArr[3]
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
            State.selectedCard = cards[indexPath.row]
            toggleButtons(temple: State.selectedCard)
            guard let templeImage = UIImage(named: State.selectedCard.filename) else {
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
