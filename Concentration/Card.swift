//
//  Card.swift
//  Concentration
//
//  Created by Sam Au on 26/10/19.
//  Copyright © 2019 Roydon. All rights reserved.
//

import Foundation

struct Card: Hashable //makes cards have its own unique hash, NOTE: Equatable is already inherited by Hashable
{
    
    public func hash(into hasher: inout Hasher){ //new way of implementing hashing
        hasher.combine(identifier)
    }
    
    //var hashValue:Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool{ //checks the if identifier of cards are equal
        return lhs.identifier == rhs.identifier
    }
    
    
    public var isFaceUp = false
    public var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier() //self refers to the cards                                 identifier
    }
}
