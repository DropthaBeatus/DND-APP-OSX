//
//  DiceRoll.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation

//functions used for dice rolls


func coinFlip(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...2)
        x += 1
    }
    return total
}

func dFour(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...4)
        x += 1
    }
    return total
}

func dSix(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...6)
        x += 1
    }
    return total
}

func dEight(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...8)
        x += 1
    }
    return total
}

func dTen(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...10)
        x += 1
    }
    return total
}

func dTwelve(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...12)
        x += 1
    }
    return total
}

func dTwenty(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...20)
        x += 1
    }
    return total
}

func dHundred(_ rolls: Int)->Int{
    var total : Int = 0
    var x = 0
    while x < rolls{
        total += Int.random(in: 1...100)
        x += 1
    }
    return total
}
