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
    var filename: String = "default.url"
    var name: String = "Temple Name"
    
    // MARK: - Init
    init() {
        // By default this builds a Temple card
    }
    
    init(filename: String, name: String) {
        self.filename = filename
        self.name = name
    }
}
