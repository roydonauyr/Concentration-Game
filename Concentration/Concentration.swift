//
//  Concentration.swift
//  Concentration
//
//  Created by Sam Au on 26/10/19.
//  Copyright © 2019 Roydon. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    private(set) var ScoreCount = 0
    private(set) var flips = 0
    
    private var SelectedCard = Set<Int>() //set which contains index of Chosen Cards
    
    private var indexOfOneAndOnlyFaceUpCard: Int? { //for var swift already knows it is mutating
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    }else {
                        return nil // this is when there are two face up cards
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue) //sets all other cards isFaceUp to false except for the index card
            }
        }
    } //optional so that all other cases returns nil
      //Computed property
    
    mutating func chooseCard(at index: Int) { //func value changes hence mutating (only funcs require mutating, variables not needed as swift already knows if it is mutable)
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards") // shows why game crashed -- when index is not less than or equal to number of cards/ invalid number
        let CardSelectedBefore = SelectedCard.contains(index)
        if !cards[index].isMatched {
            flips += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    ScoreCount += 2
                }
                else {
                    if CardSelectedBefore{
                        ScoreCount -= 1
                    }
                }
                cards[index].isFaceUp = true
            }else {
            //either no cards or 2 cards are faced up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        SelectedCard.insert(index)
    }
    

    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card] // cards.append(card) twice
            cards.shuffle()
        }
    }
    
    
}
