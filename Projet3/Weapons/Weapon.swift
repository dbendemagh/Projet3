//
//  Arm.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 12/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

// Class containing weapon properties for the characters except the magus
class Weapon : ObjectInHand {

    var damage: Int = 0
    
    init(name: ObjectsList, damage: Int) {
        self.damage = damage
        super.init(name: name)
    }
    
    
}
