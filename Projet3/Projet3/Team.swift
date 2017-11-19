//
//  Team.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 07/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Team {
    var name = ""
    var players = [Player]()
    
    func isAlive() -> Bool {
        var alive: Int = 0
        
        for player in players {
            if player.isAlive() {
                alive += 1
            }
        }
        
        return alive > 0
    }
}
