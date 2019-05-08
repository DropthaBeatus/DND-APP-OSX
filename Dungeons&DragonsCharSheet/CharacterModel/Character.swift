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
    
    let name : String
    //need to create struct//enum of class that is an array value here

    var strMod : Int
    var dexMod : Int
    var constMod : Int
    var intMod : Int
    var wisMod : Int
    var chaMod : Int
    //CONTAINS LANGAUGES, LANGUAGE CAPACITY, RACEBONUS,
    let raceStruct : RaceStruct
    
    //this makes it easy to access
    //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
var statArray : [Int] = [0,0,0,0,0,0]/*{
        didSet {
            updateAllStats()
        }
    }
 */
//athletics acrobatics sleightOfHand stealth arcana history investigation nature religion animalHandling insight medicine perception survival deception intimidation performance persuasion
    var skillArray = [Int]()// = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var playerLevel : Int = 1


    
    
    
    var charBonuses : [String]?
    
    //need to change this to measure statArray
    init(raceTemp : Race, statBlock : [Int], subRaceTemp : String?, nameTemp : String){
        
        name = nameTemp
        race = raceTemp
        raceStruct = getRaceStats(raceTemp)
        subRace = subRaceTemp
        var tempBlock = [Int]()
        var x = 0
        while(x < statBlock.count){
            tempBlock.append(statBlock[x] + raceStruct.statArrayRaceBonus[x])
            x += 1
        }
        statArray = tempBlock
        
        print(tempBlock)
        
        strMod = getModifier(tempBlock[0])
        dexMod = getModifier(tempBlock[1])
        constMod = getModifier(tempBlock[2])
        intMod = getModifier(tempBlock[3])
        wisMod = getModifier(tempBlock[4])
        chaMod = getModifier(tempBlock[5])
        skillArray = getAllSkills(stats: statArray)
        //might need to do
        //  statArray = addAllStats(tempBlock: statBlock, raceStat : getRaceStats(raceTemp))
       // statArray = addAllStats(tempBlock: statBlock, raceStat : raceStruct.statArrayRaceBonus)
    }

 
    //updates all stats
    func updateAllStats(){
        strMod = getModifier(statArray[0])
        dexMod = getModifier(statArray[1])
        constMod = getModifier(statArray[2])
        intMod = getModifier(statArray[3])
        wisMod = getModifier(statArray[4])
        chaMod = getModifier(statArray[5])
        //implement a way to add bonuses
        skillArray = getAllSkills(stats: statArray)
       // statArray = statBlock
    }
    
    func addAllStats(tempBlock : [Int], raceStat : [Int]) -> [Int]{
        var tempBlock = [Int]()
        var x = 0
        while(x < tempBlock.count){
            tempBlock.append(tempBlock[x] + raceStat[x])
            x += 1
        }
        return tempBlock
        //do not need to call because didset
        //updateAllStats()
    }

    func setSubRace(sub : String){
        subRace = sub
    }

/*
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
*/
    /*
    func classSelectandLevel(playerClass : Classes){
        switch(playerClass.classEnum){
        case .BARBARIAN:
            playerClass.levelUp()
            //need a way to setup a way for ability improvement
            statArray = playerClass.statArray
        case .PALADIN:
            playerClass.levelUp()
            statArray = playerClass.statArray
            /*
             case .BARD
             case .CLERIC
             case .DRUID
             case .FIGHTER
             case .MONK
             
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
   */
}

