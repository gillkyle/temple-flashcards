//
//  TempleCard.swift
//  TempleFlashcards
//
//  Created by Kyle Gill on 10/11/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation

struct TempleCard {
    // MARK: - Properties
    var name: String
    var imageUrl: String
    
    // MARK: - Init
    init(name: String, imageUrl: String) {
        self.name = name
        self.imageUrl = imageUrl
    }
}
