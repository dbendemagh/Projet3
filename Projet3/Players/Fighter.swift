//
//  Fighter.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 06/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Fighter : Player {
    init(name: String) {
        //let o = Sword()
        
        super.init(name: name, type: .Fighter, lifeMax: 100, object: Sword())
        
    }
}

