//
//  TempleDeck.swift
//  TempleFlashcards
//
//  Created by Kyle Gill on 10/11/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation

struct TempleDeck {
    private var cards: [TempleCard] = []
    
    init() {
        cards.append(TempleCard(name: "Bountiful", imageUrl: "dummyUrl"))
    }
    
    var count: Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
