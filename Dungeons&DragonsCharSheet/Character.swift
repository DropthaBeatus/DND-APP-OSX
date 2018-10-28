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

    var str : Int?
    var dex : Int?
    var const : Int?
    var int : Int?
    var wis : Int?
    var cha : Int?
    
    //this makes it easy to access
    //array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma
    var statArray : [Int] = [0,0,0,0,0,0]{
        didSet {
            updateAllStats(statBlock: statArray)
        }
        /*
        willSet {
            updateAllStats(statBlock: statArray)
        }
 */
    }
    var speed : Int?
    var initiative : Int?
    var hitPoints : Int?
    var armorClass : Int?
    var playerLevel : Int = 1
    var playerClasses : [Classes]?
    var languages : [String]?
    var languageCapacity : Int = 1{
        didSet {
            checkLanguageCustomize(languageCount: languageCapacity)
        }
    }
    
    var charBonuses : [String]?
    //need to change this to measure statArray
    init(raceTemp : Race, statBlock : [Int], subRaceTemp : String?, classEnum : Class){
        race = raceTemp
        subRace = subRaceTemp
        statArray = statBlock
        playerClasses?.append(Classes(level : 1, classEnum : classEnum))
        //self.updateAllStats(statBlock: statBlock)
    }
    
    //updates all stats
    func updateAllStats(statBlock : [Int]){
        str = statBlock[0]
        dex = statBlock[1]
        const = statBlock[2]
        int = statBlock[3]
        wis = statBlock[4]
        cha = statBlock[5]
       // statArray = statBlock
    }
    
    func checkLanguageCustomize(languageCount : Int){
        //might need to fix the nil coalescing
        if(languageCount > self.languages?.count ?? 1){
            //put stuff here for unction
        }
    }
    
    func setSubRace(sub : String){
        subRace = sub
    }
    
    
    
}

