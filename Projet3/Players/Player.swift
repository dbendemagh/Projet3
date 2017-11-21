//
//  Player.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

enum playerType: String {
    case Fighter = "Combattant"
    case Magus = "Mage"
    case Colossus = "Colosse"
    case Dwarf = "Nain"
}

class Player {
    
    let name: String
    let type: playerType
    var life: Int
    let lifeMax: Int
    var object: Object  // Arm or Treatment
    var experience: Int = 0
    
    init(name: String, type: playerType, lifeMax: Int, object: Object) {
        self.name = name
        self.type = type
        self.lifeMax = lifeMax
        self.life = lifeMax
        self.object = object
    }
    
    func attack(player: Player) {
        
        // Attacker alive ?
        if self.isAlive() {
            // Player to attack alive ?
            if player.isAlive() {
                print(name + " attaque " + player.name)
                
                if let arm = object as? Arm {
                    player.life = max(player.life - arm.damage, 0)
                    
                    if player.life == 0 {
                        print("Vous avez vaincu " + player.name)
                    } else {
                        print(player.name + " perd \(arm.damage) points")
                    }
                } else {
                    print(player.name + " n'est pas armé !")
                }
            } else {
                print(player.name + " est déjà mort !")
            }
        } else {
            print(name + " ne peut pas attaquer, il est mort !")
        }
    }
    
    func isAlive() -> Bool{
        return life > 0
    }
}

