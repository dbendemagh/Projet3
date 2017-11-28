//
//  Character.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

enum characterType: String {
    case Fighter = "Combattant"
    case Magus = "Mage"
    case Colossus = "Colosse"
    case Dwarf = "Nain"
}

class Character {
    
    let name: String
    let type: characterType
    var life: Int
    let lifeMax: Int
    var objectInHand: ObjectInHand
    var experience: Int = 0
    var skill: Int = 0
    
    // damage or care + skill level
    var power: Int {
        get {
            if let object = objectInHand as? Treatment {
                return object.care + (skill * 2)
            } else if let object = objectInHand as? Weapon {
                return object.damage + (skill * 2)
            }
            
            return 0
        }
    }
    
    init(name: String, type: characterType, lifeMax: Int, objectInHand: ObjectInHand) {
        self.name = name
        self.type = type
        self.lifeMax = lifeMax
        self.life = lifeMax
        self.objectInHand = objectInHand
    }
    
    func attack(character: Character) {
        
        // Attacker alive ?
        if self.isAlive() {
            // Character to attack alive ?
            if character.isAlive() {
                print(name + " attaque " + character.name)
                
                character.life = max(character.life - power, 0)
            
                if character.life == 0 {
                    print(character.name + " est vaincu")
                } else {
                    print(character.name + " perd \(power) points")
                }
                
                // Manage experience of attacker
                experience += 1
                
                // Gains a level after 3 attacks
                if experience == 3 {
                    if skill < skills.count {
                        skill += 1
                        experience = 0
                    }
                    print(name + " vient de passer au niveau : " + skills[skill])
                }
            } else {
                print(character.name + " est déjà mort !")
            }
        } else {
            print(name + " ne peut pas attaquer, il est mort !")
        }
    }
    
    func isAlive() -> Bool{
        return life > 0
    }
}

