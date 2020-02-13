//
//  Card.swift
//  Concentration
//
//  Created by Sam Au on 26/10/19.
//  Copyright © 2019 Roydon. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier() //self refers to the cards                                 identifier
    }
}
