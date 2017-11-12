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
        super.init(name: name, life: 100, strength: 10, arm: .Chopped)
    }
}

