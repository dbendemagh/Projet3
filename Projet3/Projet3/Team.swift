//
//  Team.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 07/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Team {
    var name = ""   // Team name
    var characters = [Character]()    // list of characters
    var turnForChest: Int = 0   // A chest will appear after a random number of turn
    
    // List characters with their properties
    func showCharacters() {
        var points: Int = 0
        
        //for character in characters {
        for i in 0..<characters.count {
            let character: Character = characters[i]
            
            let action: String
            
            if character.isAlive() {
                if character.type == .Magus {
                    action = "Soins"
                    if let treatment = character.objectInHand as? Treatment {
                        points = treatment.care
                    }
                } else {
                    action = "Dégats"
                    if let weapon = character.objectInHand as? Weapon {
                        points = weapon.damage
                    }
                }
                
                print("\(i + 1) - " + character.type.rawValue + " "
                    + character.name + " (Niveau : " + skills[character.skill]
                    + ") - Vie : \(character.life) - Objet : " + character.objectInHand.name.rawValue
                    + " (" + action + " : \(points))")
                
            } else {
                print("\(i + 1) - " + character.type.rawValue + " " + character.name + " est mort")
            }
        }
    }
    
    // Check life of all characters
    func isAlive() -> Bool {
        var alive: Int = 0
        
        for character in characters {
            if character.isAlive() {
                alive += 1
            }
        }
        
        // if alive = 0, team is defeated
        return alive > 0
    }
}
