//
//  Arm.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 12/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

enum listArms: String {
    case Sword = "Epée"
    case Chopped = "Hache"
    case Stick = "Bâton"
    case Shield = "Bouclier"
}

class Arm : Object {
    //var name: listArms
    var damage: Int
    
    init(name: String, damage: Int) {
        self.damage = damage
        super.init(name: name)
        
    }
}
