//
//  ClassENUM.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 4/26/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import Foundation

enum Class : String, CaseIterable{
    case BARBARIAN = "Barbarian"
    case BARD = "Bard"
    case CLERIC = "Cleric"
    case DRUID = "Druid"
    case FIGHTER = "Fighter"
    case MONK = "Monk"
    case PALADIN = "Paladin"
    case RANGER = "Ranger"
    case ROUGE = "Rouge"
    case SORCERER = "Sorcerer"
    case WARLOCK = "Warlock"
    case WIZARD = "Wizard"
    case GENERIC = "Generic"
    
    init?(id : String) {
        switch id {
        case "Barbarian": self = .BARBARIAN
        case "Bard": self = .BARD
        case "Cleric": self = .CLERIC
        case "Druid": self = .DRUID
        case "Fighter": self = .FIGHTER
        case "Monk": self = .MONK
        case "Paladin": self = .PALADIN
        case "Ranger": self = .RANGER
        case "Rouge": self = .ROUGE
        case "Sorcerer": self = .SORCERER
        case "Warlock": self = .WARLOCK
        case "Wizard": self = .WIZARD
        default: self = .GENERIC
        }
    }
}

func getAllClasses()->[Class]{
    var temp : [Class] = []
        temp.append(.BARBARIAN)
        temp.append(.PALADIN)
        temp.append(.DRUID)
    return temp
}
/*
func getAllClasses()->[Class]{
    var temp : [Class] = []
    for classDND in Class.allCases{
        temp.append(classDND)
    }
    return temp
}
*/
func returnSpecificClass(className : String, levelTemp: Int, statBlockTemp: [Int], RaceTemp : Race, subRaceTemp: String?, name : String, health : Int?)->Classes{
    //let tempCase = Class.init(id: className)
    switch(className){
        case "Barbarian":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Bard":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Cleric":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Druid":
            return Druid.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Fighter":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Monk":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Paladin":
            return Paladin.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Ranger":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Rouge":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Sorcerer":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Warlock":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        case "Wizard":
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        default:
            return Barbarian.init(level: levelTemp, statBlock: statBlockTemp, raceTemp: RaceTemp, subRaceTemp: subRaceTemp, nameTemp: name, health : health)
        }
    
}
    

