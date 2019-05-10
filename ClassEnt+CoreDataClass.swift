//
//  ClassEnt+CoreDataClass.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//
//

import UIKit
import CoreData

@objc(ClassEnt)
public class ClassEnt: NSManagedObject {
    
    var raceStruct: RaceStruct {
        get {
            let tempStruct = getRaceStats(raceString ?? "Human")
            return tempStruct
        }
        set {
            self.raceString = newValue.raceName
        }
    }
    
    var savedClass : Classes{
        get{
            let tempClass = returnSpecificClass(className: classDNDName!, levelTemp: Int(playerLevel), statBlockTemp: statArraySav, RaceTemp: Race.init(id: raceString!), subRaceTemp: subRaceString, name : name!)
            return tempClass
        }
        set{
            self.playerLevel = Int16(newValue.playerLevel)
            self.ac = Int16(newValue.AC)
            self.strength = Int16(newValue.skillArray[0])
            self.dexterity = Int16(newValue.skillArray[1])
            self.constitution = Int16(newValue.skillArray[2])
            self.intelligence = Int16(newValue.skillArray[3])
            self.wisdom = Int16(newValue.skillArray[4])
            self.charisma = Int16(newValue.skillArray[5])
            self.maxHealth = Int16(newValue.health)

        }
    }
    
    var statArraySav : [Int]{
        get{
            return [Int(strFull), Int(dexFull), Int(constFull), Int(intFull), Int(wisFull), Int(chaFull)]
        }
        set{
            self.strFull =  Int16(newValue[0])
            self.dexFull =  Int16(newValue[1])
            self.constFull =  Int16(newValue[2])
            self.intFull =  Int16(newValue[3])
            self.wisFull =  Int16(newValue[4])
            self.chaFull =  Int16(newValue[5])
        }
    }
    
    
    convenience init?( playClass : Classes, className : String?, subClass : String?) {
        /*
         NEED TO SWITCH THIS WITH WHOLE OF playCLass
         */
        let appDelegate = UIApplication.shared.delegate as? AppDelegate  //UIKit is needed to access UIApplication
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext,
            let cname = className, className != "" else {
                return nil
        }
        self.init(entity: ClassEnt.entity(), insertInto: managedContext)
        self.classDNDName = cname
        self.raceStruct = playClass.raceStruct
        self.name = playClass.name
        self.statArraySav = playClass.statArray
        self.savedClass = playClass
       

        
        if let subClassName =  subClass{
            self.subClassDNDName = subClassName
        } else {
            self.subClassDNDName = "none"
        }
        
        if let subRaceName =  playClass.subRace{
            self.subRaceString = subRaceName
        } else {
            self.subRaceString = "none"
        }
        
        self.savedClass = playClass
        
    }
    
    func update(playClass : Classes, className : String?, subClass : String?) {
        self.playerLevel = Int16(playClass.playerLevel)
        self.ac = Int16(playClass.AC)
        
        self.strength = Int16(playClass.skillArray[0])
        self.dexterity = Int16(playClass.skillArray[1])
        self.constitution = Int16(playClass.skillArray[2])
        self.intelligence = Int16(playClass.skillArray[3])
        self.wisdom = Int16(playClass.skillArray[4])
        self.charisma = Int16(playClass.skillArray[5])
        
        self.maxHealth = Int16(playClass.health)
        
        if let subClassName =  subClass{
            self.subClassDNDName = subClassName
        } else {
            self.subClassDNDName = "none"
        }
        
    }
    
}
