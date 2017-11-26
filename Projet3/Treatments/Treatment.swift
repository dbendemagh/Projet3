//
//  Treatment.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 25/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

// class for the objects that the magus can use (only for treatments)
class Treatment : ObjectInHand {
    var care: Int = 0
    
    init(name: ObjectsList, care: Int) {
        self.care = care
        super.init(name: name)
    }
}
