//
//  Races.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation

enum Race : String, CaseIterable{
    case HUMAN = "Human"
    case DWARF = "Dwarf"
    case HALFLING = "Halfling"
    case TEIFLING = "Teifling"
    case GNOME = "Gnome"
    case ELF = "Elf"

    init(id : String) {
        switch id {
        case "Dwarf": self = .DWARF
        case "Halfling": self = .HALFLING
        case "Teifling": self = .TEIFLING
        case "Gnome": self = .GNOME
        case "Elf": self = .ELF
        default: self = .HUMAN
        }
    }
}


struct RaceStruct{
    var languages : [Language]
    var speed : Int
    var languageCap : Int
    var statArrayRaceBonus : [Int]
    var nonStatBonus : [String]?
    var raceName : String
    init(languages: [Language], speed : Int, languageCap : Int, statArray : [Int], nonStatBonus : [String]?, raceName: String) {
        self.languages = languages
        self.speed = speed
        self.languageCap = languageCap
        self.statArrayRaceBonus = statArray
        self.nonStatBonus = nonStatBonus
        self.raceName = raceName
    }
}


func SubRace(race : Race)->[String]?{
    switch(race){
    case .DWARF:
        return ["Hill","Mountain", "Gray"]
    case .ELF:
        return ["High","Wood","Drow","Eladrin"]
    case .GNOME:
        return ["Rock", "Forest", "Deep"]
    case .TEIFLING:
        return ["Variant","Feral"]
    case .HALFLING:
        return ["Lightfoot", "Stout"]
        
    default:
        return nil
        
    }
}

func getAllRaces()->[Race]{
    var temp : [Race] = []
    for race in Race.allCases{
        temp.append(race)
    }
    return temp
}

//func getRaceStats(_ race: Race)-> RaceStruct{
func getRaceStats(_ race: String)-> RaceStruct{
        //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
        //ALWAYS ALWAYS INCREMENT languageCapacity AFTER APPENDING INIATE LANGUAGES!!!!!
        switch(race){
            
            //quick note only doing stats additions, vision, languages and speed for now

            case "Dwarf":
                let statBonus = [0,0,2,0,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON,.DWARVISH], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"], raceName: race)
                return raceStruct
            
            case "Elf":
                let statBonus = [0,2,0,0,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON, .ELVISH], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"], raceName: race)
                return raceStruct
            
            case "Gnome":
                let statBonus = [0,0,0,2,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON, .GNOMISH], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"], raceName: race)
                return raceStruct
            
            case "Teifling":
                let statBonus = [0,0,0,1,0,2]
                let raceStruct = RaceStruct(languages: [.COMMON, .ABYSSAL], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"], raceName: race)
                return raceStruct
            
            case "Halfling":
                let statBonus = [0,0,0,2,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON,.HALFLING], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: nil, raceName: race)
                return raceStruct
            
            
            default:
                let statBonus = [1,1,1,1,1,1]
                let raceStruct = RaceStruct(languages: [.COMMON], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: nil, raceName: race)
                return raceStruct
           // default:
            //    print("Error")
        
            }
}


