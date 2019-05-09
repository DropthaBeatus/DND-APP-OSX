
import Foundation

//used for rolling stats
//array goes in order as : strenght, dexterity, constitution, intelligence, wisdom, charisma

func rollFourDSFours()->[Int]{
    var stats : [Int] = [0,0,0,0,0,0]
    
    for x in 0...stats.count-1{
        stats[x] = dFour(4)
    }
    
    return stats
    
}

func rollFourDSixes()->[Int]{
    var stats : [Int] = [0,0,0,0,0,0]
    
    for x in 0...stats.count-1{
        stats[x] = dSix(4)
    }
    
    return stats
    
}

func rollThreeDSixes()->[Int]{
    var stats : [Int] = [0,0,0,0,0,0]
    
    for x in 0...stats.count-1{
        stats[x] = dSix(3)
    }
    
    return stats
    
}

func rollBigHuevosDTwenty()->[Int]{
    var stats : [Int] = [0,0,0,0,0,0]
    
    for x in 0...stats.count-1{
        stats[x] = dTwenty(1)
    }
    
    return stats
    
}


