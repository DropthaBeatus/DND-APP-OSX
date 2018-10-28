//
//  Classes.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
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
    
    init?(id : Int) {
        switch id {
        case 1: self = .BARBARIAN
        case 2: self = .BARD
        case 3: self = .CLERIC
        case 4: self = .DRUID
        case 5: self = .FIGHTER
        case 6: self = .MONK
        case 7: self = .PALADIN
        case 8: self = .RANGER
        case 9: self = .ROUGE
        case 10: self = .SORCERER
        case 11: self = .WARLOCK
        case 12: self = .WIZARD
        default: return nil
        }
    }
}

func getAllClasses()->[Class]{
    var temp : [Class] = []
    for classDND in Class.allCases{
        temp.append(classDND)
    }
    return temp
}

class Classes{
    var classLvl = 0
    var classEnum : Class
    
    init(level : Int, classEnum : Class){
        classLvl = level
        self.classEnum = classEnum
    }
    
    func levelUp(){
        classLvl += 1
    }
    
}
