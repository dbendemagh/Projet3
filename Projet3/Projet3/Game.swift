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
    let numberOfTeam = 2
    let numberOfPlayer = 3
    var game: Bool = false
    var uniqueCharacterNamesArray = [String]()
    
    func start() {
        
        PrintLine()
        print("⚔️      Bienvenue dans le jeu de combat        ⚔️")
        print("🛡  où deux équipes vont s'affronter à mort !  🛡")
        PrintLine()
        
        initGame()
        
        fight()
        
    }
    
    func initGame() {
        uniqueCharacterNamesArray.removeAll()
        teams.removeAll()
        
        // Create teams
        for t1 in 0..<numberOfTeam {
            createTeam(teamNumber: t1)
        }
    }
    
    func createTeam(teamNumber: Int) {
        var playerList = [Player]()
        let team = Team()
        
        team.turnForChest = Int(arc4random_uniform(5) + 2)
        print("Coffret : \(team.turnForChest)")
        
        print("")
        print("Saisissez le nom de l'équipe n° \(teamNumber + 1)")
        
        team.name = InputString()
    
        // Create players
        for p1 in 0..<numberOfPlayer {
            
            print("Veuillez choisir le personnage n° \(p1 + 1)")
            print("1 - Combattant")
            print("2 - Mage")
            print("3 - Colosse")
            print("4 - Nain")
            
            let choice = inputInt(numberItems: 4)
            
            var playerName = ""
            
            while playerName == "" {
                print("Saisissez le nom du personnage n° \(p1 + 1) :")
                let n = InputString()
                
                if uniqueCharacterNamesArray.contains(n) {
                    print("Le nom existe déjà !")
                } else {
                    playerName = n
                    uniqueCharacterNamesArray.append(n)
                }
            }
            
            switch choice {
            case 1:
                let p = Fighter(name: playerName)
                playerList.append(p)
            case 2:
                let p = Magus(name: playerName)
                playerList.append(p)
            case 3:
                let p = Colossus(name: playerName)
                playerList.append(p)
            case 4:
                let p = Dwarf(name: playerName)
                playerList.append(p)
            default:
                break
            }
        }
    
        team.players = playerList
        teams.append(team)
    }
    
    func fight() {
        var index: Int = 0
        var numberOfTurn: Int = 0
        var attacker: Int
        var opponent: Int
        var player1: Player
        var player2: Player
        var choice: Int
        
        print("")
        print("Début du combat")
        print("")
        
        game = true
        
        while game {
            attacker = index
            opponent = index ^ 1
            
            print("")
            print("Au tour de l'équipe \(teams[attacker].name)")
            print("")
            
            // Select players
            print("Sélectionnez un personnage :")
            print("")
            ShowTeam(players: teams[attacker].players)
            
            choice = inputInt(numberItems: numberOfPlayer) - 1
            
            player1 = teams[attacker].players[choice]
            
            // Chest appearing ?
            chest(team: teams[attacker], indexPlayer: choice, numberOfTurn: numberOfTurn)
            
            if let magus = player1 as? Magus {
                print("\(teams[attacker].turnForChest) \(numberOfTurn)")
                
                print("Sélectionnez le personnage que vous voulez soigner :")
                print("")
                ShowTeam(players: teams[attacker].players)
                
                choice = inputInt(numberItems: numberOfPlayer) - 1
                
                player2 = teams[attacker].players[choice]
                
                magus.treat(player: player2)
            } else {
                print("")
                print("Sélectionnez votre adversaire :")
                print("")
                ShowTeam(players: teams[opponent].players)
                
                choice = inputInt(numberItems: numberOfPlayer) - 1
                
                player2 = teams[opponent].players[choice]
                
                player1.attack(player: player2)
            }
            
            // End of game ?
            if !teams[opponent].isAlive() {
                print("")
                print("L'équipe " + teams[attacker].name + " a gagné !")
                print("Nombre de tours : \(numberOfTurn)")
                
                game = false
            }
            
            // Your turn
            index = index ^ 1
            numberOfTurn += 1
        }
    }
    
    
    // Chest appearance
    func chest(team: Team, indexPlayer: Int, numberOfTurn: Int) {
        //print("\(teams[attacker].turnForChest) \(numberOfTurn)")
        let turnForChest = team.turnForChest
        
        if turnForChest > 0 && numberOfTurn >= turnForChest {
            
            let player = team.players[indexPlayer]
            
            print("")
            
            if let magus = player as? Magus {
                print("Un coffret apparait ! " + magus.name + " obtient le super batôn de soins.")
                player.object = SuperCareStick()
            } else {
                print("Un coffret apparait ! " + player.name + " obtient le batôn de poison.")
                player.object = PoisonStick()
            }
            
            team.turnForChest = 0   // Chest appears only one time
        }
    }
    
    // Check if team is alive
    func teamsAlive() -> Bool {
        var alive = 0
        
        for t in 0..<numberOfTeam {
        
            if teams[t].isAlive() {
                alive += 1
            }
        }
        
        return alive == numberOfTeam
    }
    
    func ShowTeam(players: [Player]) {
        var points: Int = 0
        
        for i in 0..<players.count {
            let p: Player = players[i]
            
            let action: String
            
            if p.isAlive() {
                if p.type == .Magus {
                    action = "Soins : "
                    if let treatment = p.object as? Treatment {
                        points = treatment.care
                    }
                } else {
                    action = "Dégats"
                    if let arm = p.object as? Arm {
                        points = arm.damage
                        
                    }
                }
                
                //print("\(i + 1) - " + p.type.rawValue + " " + p.name + " - Vie : \(p.life) - Objet : " + p.object.name + " (" + action + " : \(points))")
                print("\(i + 1) - \(p.type.rawValue) \(p.name) - Vie : \(p.life) - Objet : \(p.object.name.rawValue) (\(action) : \(points))")
                
            } else {
                print("\(i + 1) - " + p.type.rawValue + " " + p.name + " est mort")
            }
        }
    }
    
    func listPlayers() {
        for t in 0..<numberOfTeam {
            print("Equipe " + teams[t].name)
            for p in teams[t].players {
                print("Nom : \(p.name)")
            }
        }
    }
    
    // Input Int
    func inputInt(numberItems: Int) -> Int {
        
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
    
    // Input String
    func InputString() -> String {
        repeat {
            if let input = readLine() {
                if input != "" {
                    return input
                }
            }
        } while true
    }
    
    func PrintLine() {
        print(String(repeating: "⎻", count: 50))
    }
}
