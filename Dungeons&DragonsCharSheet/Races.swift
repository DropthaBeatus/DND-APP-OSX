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
   // case HALFELF = "Half-Elf"
  //  case HALFORC = "Half-Orc"
  //  case TABAXI = "Tabaxi"
  //  case FURBLOG = "Furblog"
  //  case TORTLE = "Tortle"
  //  case ORC = "Orc"
  //  case TRITON = "Triton"
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


func SubRace(race : Race)->[String]?{
    switch(race){
//    case .HUMAN:
//        return nil
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

func getRaceStats(char: Character){
        //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
        //ALWAYS ALWAYS INCREMENT languageCapacity AFTER APPENDING INIATE LANGUAGES!!!!!
        switch(char.race){
            
            //quick note only doing stats additions, vision, languages and speed for now
            
            case .HUMAN:
                var i = 0
                while(i < char.statArray.count){
                    char.statArray[i] += 1
                    i+=1
                }
                char.languages?.append("Common")
                //need a function here to include bonus language
                char.speed = 30
                char.languageCapacity+=1
            
            case .DWARF:
                char.statArray[2] += 2
                char.speed = 25
                char.languages?.append("Common")
                char.languages?.append("Dwarvish")
                char.charBonuses?.append("Darkvision")
                char.languageCapacity+=1
            
            
            case .ELF:
                char.statArray[1] += 2
                char.speed = 30
                char.languages?.append("Common")
                char.languages?.append("Elvish")
                char.charBonuses?.append("Darkvision")
                char.languageCapacity+=1
            
            case .GNOME:
                char.statArray[3] += 2
                char.speed = 25
                char.languages?.append("Common")
                char.languages?.append("Gnomish")
                char.charBonuses?.append("Darkvision")
                char.languageCapacity+=1
            
            case .TEIFLING:
                char.statArray[3] += 1
                char.statArray[5] += 2
                char.speed = 30
                char.languages?.append("Common")
                char.languages?.append("Infernal")
                char.charBonuses?.append("Darkvision")
                char.languageCapacity+=1
            
            case .HALFLING:
                char.statArray[3] += 2
                char.speed = 25
                char.languages?.append("Common")
                char.languages?.append("Halfling")
                char.languageCapacity+=1
    }
           // default:
            //    print("Error")
        
}


