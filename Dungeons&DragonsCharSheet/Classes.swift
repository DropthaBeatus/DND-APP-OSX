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
    var statArray : [Int] = [0,0,0,0,0,0]
    var classDescription : [String]?
    var needsAbilityImprovement = false
    
    var health : Int = 0
    var AC : Int = 10
    
    var profBonus : Int = 2
    
    var strMod : Int = 0
    var dexMod : Int = 0
    var constMod : Int = 0
    var intMod : Int = 0
    var wisMod : Int = 0
    var chaMod : Int = 0
    
    var strModSave : Int = 0
    var dexModSave : Int = 0
    var constModSave : Int = 0
    var intModSave : Int = 0
    var wisModSave : Int = 0
    var chaModSave : Int = 0
    
    init(level : Int, classEnum : Class, statBlock: [Int]){
        classLvl = level
        self.classEnum = classEnum
        updateAllStats(statBlock: statArray)
        statArray = statBlock
        //should be overriden
        //make sure to check
        setModSave()
    }
    
    func levelUp(){
        classLvl += 1
    }
    
    func abilityScoreImprovement(location : Int, addition : Int){
        statArray[location] = statArray[location] + addition
        updateAllStats(statBlock: statArray)
        //should be overriden
        //make sure to check
        setModSave()
        needsAbilityImprovement = false
    }
    
    func updateAllStats(statBlock : [Int]){
        strMod = getModifier(statBlock[0])
        dexMod = getModifier(statBlock[1])
        constMod = getModifier(statBlock[2])
        intMod = getModifier(statBlock[3])
        wisMod = getModifier(statBlock[4])
        chaMod = getModifier(statBlock[5])
    }
    
    func setModSave(){
        strModSave = strMod
        dexModSave = dexMod
        constModSave = constMod
        intModSave = intMod
        wisModSave = wisMod
        chaModSave = chaMod
        
    }
    
    func setProfBonus(_ count : Int){
        self.profBonus = count
    }
}
