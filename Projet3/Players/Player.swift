//
//  Player.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

enum armList {
    case Sword
    case Chopped
    case Stick
    case WithoutArm
}

class Player {
    
    let name: String
    var life: Int
    let strength: Int
    var arm: armList
    
    init(name: String, life: Int, strength: Int, arm: armList) {
        self.name = name
        self.life = life
        self.strength = strength
        self.arm = arm
    }
}

