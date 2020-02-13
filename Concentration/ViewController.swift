//
//  ViewController.swift
//  Concentration
//
//  Created by Sam Au on 25/9/19.
//  Copyright © 2019 Roydon. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards:Int {
            return (cardButtons.count+1)/2 // read only computed property, hence get is not needed
    }
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    private(set) var GameScore = 0 {
        didSet {
            Score.text = "Score: \(GameScore)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private weak var Score: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else{
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction private func NewGame(_ sender: UIButton) {
        flipCount = 0
        GameScore = 0
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = theme.ChooseRandomThemeIcons()
        updateViewFromModel()
        
    }
    
    
    private func updateViewFromModel() {
        GameScore = game.ScoreCount
        flipCount = game.flips
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)//if face down and matched, both card becomes transparent
            }
        }
    }
    
    
    private var theme = Theme()
    private lazy var emojiChoices = theme.ChooseRandomThemeIcons()
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil,emojiChoices.count > 0 {       // You can place two ifs on the same line
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"  // if emoji[card.identifier] != nil {      //returns an optional due to dictionary
                                              //return emoji[card.identifier]! } else { return "?" }
    }
}

extension Int{
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
             return -Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
} // self will be the total number in a specific array EG: emojiChoices.count
