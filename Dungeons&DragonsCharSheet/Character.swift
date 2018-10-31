//
//  Character.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation


class Character{
    
    let race : Race
    var subRace : String?
    
  //  let name : String?
    //need to create struct//enum of class that is an array value here

    var strMod : Int?
    var dexMod : Int?
    var constMod : Int?
    var intMod : Int?
    var wisMod : Int?
    var chaMod : Int?
    
    //this makes it easy to access
    //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
    var statArray : [Int] = [0,0,0,0,0,0]{
        didSet {
            updateAllStats(statBlock: statArray)
        }
    }
//athletics acrobatics sleightOfHand stealth arcana history investigation nature religion animalHandling insight medicine perception survival deception intimidation performance persuasion
    var skillArray : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var speed : Int?
    var initiative : Int?
    var hitPoints : Int?
    var armorClass : Int?
    var playerLevel : Int = 1
    var playerClasses : [Classes]?
    var languages : [String]?
    var HP : Int = 0
    
    var languageCapacity : Int = 1{
        didSet {
            checkLanguageCustomize(languageCount: languageCapacity)
        }
    }
    
    var charBonuses : [String]?
    //need to change this to measure statArray
    init(raceTemp : Race, statBlock : [Int], subRaceTemp : String? /*classEnum : Class*/){
        race = raceTemp
        subRace = subRaceTemp
        statArray = statBlock
        //let k = classSelectandCreate(playerClass: classEnum)
       // playerClasses.append(k)//(classSelectandCreate(playerClass: classEnum))
        //self.updateAllStats(statBlock: statBlock)
    }
    
    func transferFromClasses(){
        for item in 0...playerClasses!.count-1{
            HP = playerClasses![item].health
        }
    }
    
    //updates all stats
    func updateAllStats(statBlock : [Int]){
        strMod = getModifier(statBlock[0])
        dexMod = getModifier(statBlock[1])
        constMod = getModifier(statBlock[2])
        intMod = getModifier(statBlock[3])
        wisMod = getModifier(statBlock[4])
        chaMod = getModifier(statBlock[5])
        //implement a way to add bonuses
        skillArray = getAllSkills(stats: statBlock)
       // statArray = statBlock
    }
    
    func checkLanguageCustomize(languageCount : Int){
        //might need to fix the nil coalescing
        if(languageCount > self.languages?.count ?? 1){
            //put stuff here for unction
            //return bool
        }
    }
    
    func setSubRace(sub : String){
        subRace = sub
    }
    
    func multiClass(){
       // playerClasses?.append()
    }
    
    func classSelectandCreate(playerClass : Class)->Classes{
        switch(playerClass){
        case .BARBARIAN:
            return Barbarian(level: 1, classEnum: playerClass, statBlock: statArray)
                /*
            case .BARD
            case .CLERIC
            case .DRUID
            case .FIGHTER
            case .MONK
            case .PALADIN
            case .RANGER
            case .ROUGE
            case .SORCERER
            case .WARLOCK
            case .WIZARD
                */
        default :
            return Classes(level: 1, classEnum: playerClass, statBlock: statArray)
        }
    }
    
    func classSelectandLevel(playerClass : Classes){
        switch(playerClass.classEnum){
        case .BARBARIAN:
            playerClass.levelUp()
            //need a way to setup a way for ability improvement
            statArray = playerClass.statArray
            /*
             case .BARD
             case .CLERIC
             case .DRUID
             case .FIGHTER
             case .MONK
             case .PALADIN
             case .RANGER
             case .ROUGE
             case .SORCERER
             case .WARLOCK
             case .WIZARD
             */
        default :
            return
        }
    }
    
    
}

