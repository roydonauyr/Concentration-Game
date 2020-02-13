//
//  Theme.swift
//  Concentration
//
//  Created by Sam Au on 17/11/19.
//  Copyright © 2019 Roydon. All rights reserved.
//

import Foundation

class Theme{
    enum Theme {
        case HalloweenEmoji
        case AnimalsEmoji
        case FacesEmoji
        case SportsEmoji
        case VehiclesEmoji
        case FoodEmoji
    }
    
    private func ChooseRandomTheme(by ChosenTheme: Theme) ->[String]{
        switch ChosenTheme{
        case .HalloweenEmoji:
            return ["😈","🤡","🎃","👾","💀","☠️","👽","🤖","🧜🏻‍♂️","🧚🏻‍♀️"]
        case .AnimalsEmoji:
            return ["🐶","🐱","🐭","🐹","🐼","🐨","🐯","🦁","🐮","🐷"]
        case .FacesEmoji:
            return ["😀","😃","😫","😴","🥺","😭","😔","😤","😇","🙃"]
        case .SportsEmoji:
            return ["⚽️","🏀","🏈","🥎","🥏","🏑","🥅","⛳️","🏹","🏐"]
        case .VehiclesEmoji:
            return ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐"]
        case .FoodEmoji:
            return ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈"]
        }
    
    }
    
    private func random() -> Theme{
        var RandomTheme = [Theme.HalloweenEmoji,Theme.AnimalsEmoji,Theme.FacesEmoji,Theme.SportsEmoji,Theme.VehiclesEmoji,Theme.FoodEmoji]
        //let randomIndex = Int(arc4random_uniform(UInt32(RandomTheme.count)))
        return RandomTheme[RandomTheme.count.arc4random]
    }
    
    func ChooseRandomThemeIcons() ->[String]{
        return ChooseRandomTheme(by: random())
    }

}




