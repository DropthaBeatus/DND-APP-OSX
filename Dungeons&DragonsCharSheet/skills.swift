//
//  skills.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation

//athletics acrobatics sleightOfHand stealth arcana history investigation nature religion animalHandling insight medicine perception survival deception intimidation performance persuasion
var skillArray : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func getModifier(_ skill : Int)->Int{
    let temp : Double = 5
    if(skill < 10){
        let total = temp - (floor(Double(skill/2)))
        return Int(total * -1)
    }
    else{
        let total = temp - (floor(Double(skill/2)))
        return Int(total * -1)
    }
}

func getAllSkills(stats : [Int])->[Int]{
    var skills : [Int] = []
    skills.append(getModifier(stats[0]))
    for _ in 0...2{
        skills.append(getModifier(stats[1]))
    }
    for _ in 0...4{
        skills.append(getModifier(stats[3]))
    }
    for _ in 0...3{
        skills.append(getModifier(stats[4]))
    }
    for _ in 0...3{
        skills.append(getModifier(stats[5]))
    }
    
    return skills
}

