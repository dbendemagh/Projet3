//
//  Magus.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Magus : Player {
    init(name: String) {
        super.init(name: name, type: .Magus, lifeMax: 80, object: Stick())
    }
    
    func treat(player: Player) {
        
        // Magus alive ?
        if self.isAlive() {
            // Player to treat alive ?
            if player.isAlive() {
                if let treatment = self.object as? Treatment {
                    if player.life == player.lifeMax {
                        print(player.name + " a déjà tous ses points de vie.")
                    } else {
                        let l = player.life
                        player.life = min(player.life + treatment.care, player.lifeMax)
                        print(player.name + " gagne \(player.life - l) points de vie.")
                    }
                } else {
                    print(player.name + " ne peut pas soigner !")
                }
            } else {
                print("\(player.name) ne peut pas être soigné, il est mort !")
            }
        } else {
            print(name + " ne peut pas soigner, il est mort !")
        }
    }
    
    // Magus cannot attack
    override func attack(player: Player) {
        print("Un mage ne peut pas attaquer")
    }
    
}
