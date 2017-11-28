//
//  Magus.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Magus : Character {
    init(name: String) {
        super.init(name: name, type: .Magus, lifeMax: 80, objectInHand: CareStick())
    }
    
    func treat(character: Character) {
        
        // Magus is alive ?
        if self.isAlive() {
            // Character to treat is alive ?
            if character.isAlive() {
                    if character.life == character.lifeMax {
                        print(character.name + " a déjà tous ses points de vie.")
                    } else {
                        print(name + " soigne " + character.name + ".")
                        let tempLife = character.life
                        character.life = min(character.life + character.power, character.lifeMax)
                        print(character.name + " gagne \(character.life - tempLife) points de vie.")

                    }
            } else {
                print("\(character.name) ne peut pas être soigné, il est mort !")
            }
        } else {
            print(name + " ne peut pas soigner, il est mort !")
        }
    }
    
    // Magus cannot attack
    override func attack(character: Character) {
        print("Un mage ne peut pas attaquer")
    }
    
}
