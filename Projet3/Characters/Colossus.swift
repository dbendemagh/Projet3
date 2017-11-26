//
//  Colossus.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Colossus : Character {
    init(name: String) {
        super.init(name: name, type: .Colossus, lifeMax: 150, objectInHand: Shield())
    }
}
