//
//  Object.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 19/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

// Object that the character will have in hand
// It could be a weapon or a health care
//
class ObjectInHand {
    var name: ObjectsList
    
    init(name: ObjectsList) {
        self.name = name
    }
}
