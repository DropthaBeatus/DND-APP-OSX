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

    init?(id : Int) {
        switch id {
        case 1: self = .HUMAN
        case 2: self = .DWARF
        case 3: self = .HALFLING
        case 4: self = .TEIFLING
        case 5: self = .GNOME
        case 6: self = .ELF
        default: return nil
        }
    }
}


struct RaceStruct{
    var languages : [Language]
    var speed : Int
    var languageCap : Int
    var statArrayRaceBonus : [Int]
    var nonStatBonus : [String]?
    init(languages: [Language], speed : Int, languageCap : Int, statArray : [Int], nonStatBonus : [String]?) {
        self.languages = languages
        self.speed = speed
        self.languageCap = languageCap
        self.statArrayRaceBonus = statArray
        self.nonStatBonus = nonStatBonus
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

func getRaceStats(_ race: Race)-> RaceStruct{
        //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
        //ALWAYS ALWAYS INCREMENT languageCapacity AFTER APPENDING INIATE LANGUAGES!!!!!
        switch(race){
            
            //quick note only doing stats additions, vision, languages and speed for now
            
            case .HUMAN:
                let statBonus = [1,1,1,1,1,1]
                let raceStruct = RaceStruct(languages: [.COMMON], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: nil)
                return raceStruct
            
            case .DWARF:
                let statBonus = [0,0,2,0,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON,.DWARVISH], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"])
                return raceStruct
            
            case .ELF:
                let statBonus = [0,2,0,0,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON, .ELVISH], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"])
                return raceStruct
            
            case .GNOME:
                let statBonus = [0,0,0,2,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON, .GNOMISH], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"])
                return raceStruct
            
            case .TEIFLING:
                let statBonus = [0,0,0,1,0,2]
                let raceStruct = RaceStruct(languages: [.COMMON, .ABYSSAL], speed: 30, languageCap: 3, statArray: statBonus, nonStatBonus: ["Darkvision"])
                return raceStruct
            
            case .HALFLING:
                let statBonus = [0,0,0,2,0,0]
                let raceStruct = RaceStruct(languages: [.COMMON,.HALFLING], speed: 25, languageCap: 3, statArray: statBonus, nonStatBonus: nil)
                return raceStruct
    }
           // default:
            //    print("Error")
        
}


