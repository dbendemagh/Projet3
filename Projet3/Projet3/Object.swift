//
//  Object.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 19/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

enum ObjectsList: String {
    case Sword = "Epée"
    case Chopped = "Hache"
    case Shield = "Bouclier"
    case PoisonStick = "Batôn de poison"
    case CareStick = "Bâton de soins"
    case SuperCareStick = "Super batôn de soins"
}

class Object {
    var name: ObjectsList
    
    init(name: ObjectsList) {
        self.name = name
    }
}
