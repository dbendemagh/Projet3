//
//  Treatment.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 19/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Treatment : Object {
    let care: Int
    
    init(name: ObjectsList, care: Int) {
        self.care = care
        super.init(name: name)
    }
}
