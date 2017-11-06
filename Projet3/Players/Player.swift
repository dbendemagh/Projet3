//
//  Player.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var life: Int
    let strength: Int
    var arm: String
    
    init(name: String, life: Int, strength: Int, arm: String) {
        self.name = name
        self.life = life
        self.strength = strength
        self.arm = arm
    }
}

