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
    let numberOfCharacter = 3
    var game: Bool = false
    
    func start() {
        
        printLine()
        print("⚔️      Bienvenue dans le jeu de combat        ⚔️")
        print("🛡  où deux équipes vont s'affronter à mort !  🛡")
        printLine()
        
        game = true
        
        // Create teams
        for t1 in 0..<numberOfTeam {
            createTeam(teamNumber: t1)
        }
        
        while game {
        
            fight()
            
            // Replay ?
            print("")
            print("Voulez-vous refaire une partie ?")
            print("")
            print("1 - Rejouer avec les mêmes équipes")
            print("2 - Rejouer avec de nouvelles équipes")
            print("3 - Quitter")
            
            let choice = inputMenu(numberItems: 3)
            
            switch choice {
            case 1:
                resetTeams()
            case 2:
                teams.removeAll()
                // Create teams
                for t1 in 0..<numberOfTeam {
                    createTeam(teamNumber: t1)
                }
            case 3:
                game = false
            default:
                break
            }
        }
    }
    
    // Reset teams with originals objets
    func resetTeams() {
        for t in 0..<numberOfTeam {
            for c in 0..<numberOfCharacter {
                let character: Character = teams[t].characters[c]
                
                character.life = character.lifeMax
                character.skill = 0
                
                switch character.type {
                case .Fighter:
                    character.objectInHand = Sword()
                case .Magus:
                    character.objectInHand = CareStick()
                case .Colossus:
                    character.objectInHand = Shield()
                case .Dwarf:
                    character.objectInHand = Chopped()
                }
            }
        }
    }
    
    // Create team
    func createTeam(teamNumber: Int) {
        var characterList = [Character]()
        let team = Team()
        var tempTeamName: String = ""
        var tempCharacterName: String = ""
        var characterName: String = ""
        var uniqueCharacterNamesArray = [String]()
        
        print("")
        print("Saisissez le nom de l'équipe n° \(teamNumber + 1)")
        
        repeat {
            tempTeamName = InputString()
        } while tempTeamName == ""
        
        team.name = tempTeamName
        
        // Create characters
        for p1 in 0..<numberOfCharacter {
            
            print("")
            print("Veuillez choisir le personnage n° \(p1 + 1)")
            print("1 - Combattant")
            print("2 - Mage")
            print("3 - Colosse")
            print("4 - Nain")
            
            let choice = inputMenu(numberItems: 4)
            
            characterName = ""
            
            while characterName == "" {
                print("Saisissez le nom du personnage n° \(p1 + 1) :")
                
                tempCharacterName = ""
                
                repeat {
                    tempCharacterName = InputString()
                } while tempCharacterName == ""
                
                // Check if the name is unique
                if uniqueCharacterNamesArray.contains(tempCharacterName) {
                    print("Le nom existe déjà !")
                } else {
                    characterName = tempCharacterName
                    uniqueCharacterNamesArray.append(characterName)
                }
            }
            
            switch choice {
            case 1:
                let p = Fighter(name: characterName)
                characterList.append(p)
            case 2:
                let p = Magus(name: characterName)
                characterList.append(p)
            case 3:
                let p = Colossus(name: characterName)
                characterList.append(p)
            case 4:
                let p = Dwarf(name: characterName)
                characterList.append(p)
            default:
                break
            }
        }
        
        // Add the characters to the team
        team.characters = characterList
        teams.append(team)
    }
    
    // Fight betweens the teams
    func fight() {
        var indexAttackerTeam: Int = 0      // Index of attacker team
        var indexOpponentTeam: Int          // Index of opponent team in case of attack
        var indexCharacter: Int             // Index of character
        
        var actingCharacter: Character      // Character who act : attack or treatment
        var receivingCharacter: Character   // Character who receive : weapon attack or health care
        
        var numberOfTurn: Int = 0
        var fight: Bool                     // Fight stop when a team is defeated
        
        print("")
        print("Début du combat")
        
        fight = true
        
        while fight {
            // The opponent index is the reverse of attacker index
            indexOpponentTeam = indexAttackerTeam ^ 1   // 0 or 1
            
            print("")
            print("Au tour de l'équipe \(teams[indexAttackerTeam].name)")
            print("")
            
            // Select characters
            print("Sélectionnez un personnage :")
            print("")
            teams[indexAttackerTeam].showCharacters()
            
            indexCharacter = inputMenu(numberItems: numberOfCharacter) - 1
            
            actingCharacter = teams[indexAttackerTeam].characters[indexCharacter]
            
            // A chest will appear randomly
            let randomChest = Int(arc4random_uniform(6))
            
            // The magus take care of his team
            if let magus = actingCharacter as? Magus {
                
                // The chest appears ?
                if randomChest == 3 {
                    print("Un coffre apparaît ! " + magus.name + " obtient le super batôn de soins.")
                    magus.objectInHand = SuperCareStick()
                }
                
                print("Sélectionnez le personnage que vous voulez soigner :")
                print("")
                teams[indexAttackerTeam].showCharacters()
                
                indexCharacter = inputMenu(numberItems: numberOfCharacter) - 1
                
                receivingCharacter = teams[indexAttackerTeam].characters[indexCharacter]
                
                magus.treat(character: receivingCharacter)
            } else {
                
                // The chest appears ?
                if randomChest == 3 {
                    print("Un coffre apparait ! " + actingCharacter.name + " obtient le batôn de poison.")
                    actingCharacter.objectInHand = PoisonStick()
                }
                
                print("")
                print("Sélectionnez votre adversaire :")
                print("")
                teams[indexOpponentTeam].showCharacters()
                
                indexCharacter = inputMenu(numberItems: numberOfCharacter) - 1
                
                receivingCharacter = teams[indexOpponentTeam].characters[indexCharacter]
                
                actingCharacter.attack(character: receivingCharacter)
            }
            
            // Team defeated ?
            if !teams[indexOpponentTeam].isAlive() {
                print("")
                print("L'équipe " + teams[indexAttackerTeam].name + " a vaincu l'équipe " + teams[indexOpponentTeam].name + " !")
                print("")
                print("Nombre de tours : \(numberOfTurn)")
                
                fight = false
            }
            
            // Change attacker team
            indexAttackerTeam = indexAttackerTeam ^ 1   // 0 or 1
            numberOfTurn += 1
        }
    }
    
    // Input Menu
    func inputMenu(numberItems: Int) -> Int {
        
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
        guard let data = readLine() else { return "" }
        return data
    }
    
    // Print separator line
    func printLine() {
        print(String(repeating: "⎻", count: 50))
    }
}
