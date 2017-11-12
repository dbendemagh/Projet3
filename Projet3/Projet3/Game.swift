//
//  Game.swift
//  Projet3
//
//  Created by Daniel BENDEMAGH on 07/11/2017.
//  Copyright © 2017 Daniel BENDEMAGH. All rights reserved.
//

import Foundation

class Game {
    var teams = [Team]()
    var name = ""
    let numberOfTeam = 2
    let numberOfPlayer = 3
    
    func start() {
        
        print("Bienvenue dans le jeu")
        print("Vous allez affronter ...")
        
        for t1 in 0..<numberOfTeam {
            createTeam(teamNumber: t1)
        }
        
        listPlayers()
    }
    
    func createTeam(teamNumber: Int) {
        var playerList = [Player]()
        let t1 = Team()
        //teams.append(t1)
        
        // For each team
        //for t1 in 0...1 {
            
            name = ""
            
            while name == "" {
                print("Saisissez le nom de l'équipe n° \(teamNumber + 1)")
                
                if let n = readLine() {
                    if n != "" {
                        name = n
                    }
                }
            }
            
            t1.name = name
            print("Equipe \(name)")
            
            // Create 3 players
            for p1 in 0..<numberOfPlayer {
                
                print("Veuillez choisir un personnage :")
                print("1 - Combattant")
                print("2 - Mage")
                print("3 - Colosse")
                print("4 - Nain")
                
                let choice = input(numberItems: 4)
                
                name = ""
                
                while name == "" {
                    print("Saisissez le nom du personnage n° \(p1 + 1) :")
                    if let n = readLine() {
                        if nameExist(name: n) {
                            print("Le nom existe déjà !")
                        } else {
                            name = n
                        }
                    }
                }
                
                switch choice {
                case 1:
                    let p = Fighter(name: name)
                    playerList.append(p)
                case 2:
                    let p = Magus(name: name)
                    playerList.append(p)
                case 3:
                    let p = Colossus(name: name)
                    playerList.append(p)
                case 4:
                    let p = Dwarf(name: name)
                    playerList.append(p)
                default:
                    break
                }
            }
        
            t1.team = playerList
            teams.append(t1)
        //}
    }
    
    func nameExist(name: String) -> Bool {
        
        for t in 0..<teams.count {
            for p in teams[t].team {
                if p.name == name {
                    return true
                }
            }
        }
        
        return false
    }
    
    
    func listPlayers() {
        for t in 0...1 {
            print("Equipe \(teams[t].name)")
            for p in teams[t].team {
                print("Nom : \(p.name)")
            }
        }
    }
    
    func input(numberItems: Int) -> Int {
        
        repeat {
            if let input = readLine() {
                if let choice = Int(input) {
                    if choice > 0 && choice <= numberItems {
                        return choice
                    }
                }
            }
            
            print("Veuiller faire un choix entre 1 et \(numberItems)")
            
        } while true
    }
    
}
