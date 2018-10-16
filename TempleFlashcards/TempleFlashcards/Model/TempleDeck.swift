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
        cards.append(TempleCard(filename: "aba-nigeria-temple-lds-273999-mobile.jpg", name: "Aba Nigeria"));
        cards.append(TempleCard(filename: "accra-ghana-temple-lds-249027-mobile.jpg", name: "Accra Ghana"));
        cards.append(TempleCard(filename: "albuquerque-temple-lds-137885-mobile.jpg", name: "Albuquerque New Mexico"));
        cards.append(TempleCard(filename: "anchorage-temple-lds-253274-mobile.jpg", name: "Anchorage Alaska"));
        cards.append(TempleCard(filename: "apia-samoa-temple-lds-460475-mobile.jpg", name: "Apia Samoa"));
        cards.append(TempleCard(filename: "asuncion-paraguay-temple-lds-298372-mobile.jpg", name: "Asunción Paraguay"));
        cards.append(TempleCard(filename: "atlanta-georgia-temple-sunset-1218213-mobile.jpg", name: "Atlanta Georgia"));
        cards.append(TempleCard(filename: "baton-rouge-temple-lds-1078084-mobile.jpg", name: "Baton Rouge Louisiana"));
        cards.append(TempleCard(filename: "bern-switzerland-temple-lds-653038-mobile.jpg", name: "Bern Switzerland"));
        cards.append(TempleCard(filename: "billings-temple-lds-946466-mobile.jpg", name: "Billings Montana"));
        cards.append(TempleCard(filename: "birmingham-temple-lds-130170-mobile.jpg", name: "Birmingham Alabama"));
        cards.append(TempleCard(filename: "bismarck-temple-lds-408056-mobile.jpg", name: "Bismarck North Dakota"));
        cards.append(TempleCard(filename: "bogota-colombia-mormon-temple-856490-mobile.jpg", name: "Bogotá Colombia"));
        cards.append(TempleCard(filename: "boise-temple-lds-39439-mobile.jpg", name: "Boise Idaho"));
        cards.append(TempleCard(filename: "boston-temple-lds-945541-mobile.jpg", name: "Boston Massachusetts"));
        cards.append(TempleCard(filename: "bountiful-temple-766491-mobile.jpg", name: "Bountiful Utah"));
        cards.append(TempleCard(filename: "brigham-city-utah-temple-dedication-day-1027033-mobile.jpg", name: "Brigham City Utah"));
        cards.append(TempleCard(filename: "brisbane-australia-temple-lds-745088-mobile.jpg", name: "Brisbane Australia"));
        cards.append(TempleCard(filename: "buenos-aires-argentina-temple-lds-82744-mobile.jpg", name: "Buenos Aires Argentina"));
        cards.append(TempleCard(filename: "calgary-alberta-temple-before-open-house-1033408-mobile.jpg", name: "Calgary Alberta"));
        cards.append(TempleCard(filename: "campinas-brazil-temple-lighted-1029894-mobile.jpg", name: "Campinas Brazil"));
        cards.append(TempleCard(filename: "cardston-alberta-temple-lds-782043-mobile.jpg", name: "Cardston Alberta"));
        cards.append(TempleCard(filename: "cebu-philippines-temple-lds-852837-mobile.jpg", name: "Cebu City Philippines"));
        cards.append(TempleCard(filename: "chicago-temple-lds-885844-mobile.jpg", name: "Chicago Illinois"));
        cards.append(TempleCard(filename: "ciudad-juarez-mexico-temple-lds-126122-mobile.jpg", name: "Ciudad Juárez Mexico"));
        cards.append(TempleCard(filename: "colonia-juarez-mexico-temple-lds-1039762-mobile.jpg", name: "Colonia Juárez Chihuahua Mexico"));
        cards.append(TempleCard(filename: "columbia-river-temple-lds-761262-mobile.jpg", name: "Columbia River Washington"));
        cards.append(TempleCard(filename: "columbia-temple-lds-83400-mobile.jpg", name: "Columbia South Carolina"));
        cards.append(TempleCard(filename: "columbus-temple-lds-406110-mobile.jpg", name: "Columbus Ohio"));
        cards.append(TempleCard(filename: "copenhagen-denmark-temple-895949-mobile.jpg", name: "Copenhagen Denmark"));
        cards.append(TempleCard(filename: "cordoba-argentina-temple-rendering-780527-mobile.jpg", name: "Córdoba Argentina"));
        cards.append(TempleCard(filename: "curitiba-brazil-temple-lds-851199-mobile.jpg", name: "Curitiba Brazil"));
        cards.append(TempleCard(filename: "dallas-temple-lds-850748-mobile.jpg", name: "Dallas Texas"));
        cards.append(TempleCard(filename: "denver-temple-lds-999518-mobile.jpg", name: "Denver Colorado"));
        cards.append(TempleCard(filename: "detroit-temple-lds-837623-mobile.jpg", name: "Detroit Michigan"));
        cards.append(TempleCard(filename: "draper-utah-lds-temple-1079449-mobile.jpg", name: "Draper Utah"));
        cards.append(TempleCard(filename: "guatemala-lds-temple-82739-mobile.jpg", name: "Edmonton Alberta"));
        cards.append(TempleCard(filename: "helsinki-finland-temple-lds-354503-mobile.jpg", name: "Helsinki Finland"));
        cards.append(TempleCard(filename: "kyiv-ukraine-temple-lds-774302-mobile.jpg", name: "Kyiv Ukraine"));
        cards.append(TempleCard(filename: "hawaii-temple-761091-mobile.jpg", name: "Laie Hawaii"));
        cards.append(TempleCard(filename: "madrid-spain-temple-954939-mobile.jpg", name: "Madrid Spain"));
        cards.append(TempleCard(filename: "mexico-city-temple-lds-591669-mobile.jpg", name: "Mexico City Mexico"));
    }
    
    subscript(index: Int) -> TempleCard {
        get {
            return cards[index]
        }
        set {
            cards[index] = newValue
        }
    }
    
    var count: Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
