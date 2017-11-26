//
//  Dwarf.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Dwarf: Character {
    init(name: String) {
        super.init(name: name, type: .Dwarf, lifeMax: 50, objectInHand: Chopped())
    }
}

