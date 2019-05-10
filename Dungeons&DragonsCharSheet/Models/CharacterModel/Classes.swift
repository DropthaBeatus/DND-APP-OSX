//
//  Classes.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation


class Classes : Character{
    
    //var classLvl = 0
    //var classEnum : Class
    //var statArray : [Int] = [0,0,0,0,0,0]
    //var classDescription : [String]?
    var needsAbilityImprovement = false
    
    var health : Int = 0
    var AC : Int = 10
    
    var profBonus : Int = 2
    var attackCount = 1
    
    var strModSave : Int = 0
    var dexModSave : Int = 0
    var constModSave : Int = 0
    var intModSave : Int = 0
    var wisModSave : Int = 0
    var chaModSave : Int = 0
    
    var className = Class.init(id: "Generic")
    
    init(level : Int, statBlock: [Int], raceTemp : Race, subRaceTemp : String?, nameTemp : String){
        super.init(raceTemp: raceTemp, statBlock: statBlock, subRaceTemp: subRaceTemp, nameTemp: nameTemp)
        setModSave()
    }
    
    func levelUp(){
        playerLevel += 1
    }
    
    func abilityScoreImprovement(location : Int, addition : Int){
        statArray[location] = statArray[location] + addition
        updateAllStats()
        setModSave()
        needsAbilityImprovement = false
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
