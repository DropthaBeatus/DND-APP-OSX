//
//  Druid.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import Foundation

class Druid : Classes{
    
    var DivineSence : Int = 1
    var LayOnHands : Int = 1
    var path : druPath?
    var classDescription = [String]()
    
    override init(level levelT : Int, statBlock statBlockT: [Int], raceTemp raceTempT : Race, subRaceTemp subRaceTempT : String?, nameTemp: String){
        super.init(level: levelT, statBlock: statBlockT, raceTemp: raceTempT, subRaceTemp: subRaceTempT, nameTemp: nameTemp)
        super.className = Class.init(id: "Paladin")
        
        classDescription.append("Divine Sense - As an action, until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type of any being whose presence you sense, but not its identity. Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated. You can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses.\n\n")
        classDescription.append("Lay On Hands - You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level x 5. As an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool. Alternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one. This feature has no effect on undead and constructs. \n\n")
        super.health = self.constMod + 10
        var x = 0
        while(x < levelT){
            prepareLevel(super.playerLevel)
            x += 1
        }
        setModSave()
    }
    
    
    override func levelUp(){
        super.levelUp()
        prepareLevel(super.playerLevel)
        setAverageHealth()
    }
    
    func setHealth(){
        health = self.health + self.constMod + dTen(1)
    }
    
    
    func setMaxHealth(){
        health = self.health + self.constMod + 12
    }
    
    func setAverageHealth(){
        health = self.health + self.constMod + 5
    }
    
    func divineSenseCounts(){
        DivineSence = 1 + chaMod
    }
    
    func LayOnHandsCounts(){
        LayOnHands = playerLevel * 5
    }
    
    func prepareLevel(_ playerLevel : Int){
        divineSenseCounts()
        LayOnHandsCounts()
        switch(playerLevel){
        case 2:
            classDescription.append("Starting at 2nd level, when you hit a creature with a melee weapon attack, you can expend one spell slot to deal radiant damage to the target, in addition to the weapon's damage. The extra damage is 2d8 for a 1st-level spell slot, plus 1d8 for each spell-level higher than 1st, to a maximum of 5d8. The damage increases by 1d8 if the target is an undead or a fiend, to a maximum of 6d8. \n\n")
            classDescription.append("By 3rd level, the divine magic flowing through you makes you immune to disease.\n\n")
            fallthrough
        case 3:
            classDescription.append("Your oath allows you to channel divine energy to fuel magical effects. Each Channel Divinity option provided by your oath explains how to use it. When you use your Channel Divinity, you choose which option to use. You must then finish a short or long rest to use your Channel Divinity again. Some Channel Divinity effects require saving throws. When you use such an effect from this class, the DC equals your paladin spell save DC\n\n")
            levelPath(path: .CROWN)
        case 4:
            super.needsAbilityImprovement = true
            fallthrough
        case 5:
            super.attackCount = 2
            setProfBonus(3)
        case 6:
            levelPath(path: .CROWN)
            classDescription.append("Starting at 6th level, whenever you or a friendly creature within 10 feet of you must make a saving throw, the creature gains a bonus to the saving throw equal to your Charisma modifier (with a minimum bonus of +1). You must be conscious to grant this bonus. At 18th level, the range of this aura increases to 30 feet.\n\n")
            fallthrough
        case 7:
            fallthrough
        case 8:
            super.needsAbilityImprovement = true
            fallthrough
        case 9:
            classDescription.append("Brutal Attack: you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.This increases to two additional dice at 13th level and three additional dice at 17th level. ")
            setProfBonus(4)
            fallthrough
        case 10:
            classDescription.append("Starting at 10th level, you and friendly creatures within 10 feet of you can't be frightened while you are conscious. At 18th level, the range of this aura increases to 30 feet./n/n")
            levelPath(path: .CROWN)
            fallthrough
        case 11:
            classDescription.append("By 11th level, whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage./n/n")
            fallthrough
        case 12:
            super.needsAbilityImprovement = true
            setProfBonus(5)
            fallthrough
        case 13:
            fallthrough
            
        case 14:
            classDescription.append("Beginning at 14th level, you can use your action to end one spell on yourself or on one willing creature that you touch. You can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain expended uses when you finish a long rest.\n\n")
            levelPath(path: .CROWN)
            fallthrough
        case 15:
            classDescription.append("Persistent Rage: Your rage ends early only if you fall unconscious or if you choose to end it.")
            fallthrough
        case 16:
            super.needsAbilityImprovement = true
            fallthrough
        case 17:
            setProfBonus(6)
            fallthrough
        case 18:
            classDescription.append("Beginning at 18th level, if your total for a Strength check is less than your Strength score, you can use that score in place of the total.")
            fallthrough
        case 19:
            super.needsAbilityImprovement = true
            fallthrough
        case 20:
            super.statArray[2] = statArray[2]+4
            super.statArray[0] = statArray[0]+4
            fallthrough
        default:
            return
            
        }
    }
    
    
    override func setModSave(){
        super.strModSave = super.strMod
        super.dexModSave = super.dexMod
        super.constModSave = super.constMod
        super.intModSave = super.intMod
        super.wisModSave = super.wisMod + profBonus
        super.chaModSave = super.chaMod + profBonus
    }
    
    enum druPath : String, CaseIterable{
        case ANCIENTS = "Oath of the Ancients"
        case CONQUEST = "Oath of Conquest"
        case CROWN = "Oath of the Crown"
        case DEVOTION = "Oath of Devotion"
        case REDEMPTION = "Oath of Redemption"
        case VENGEANCE = "Oath of Vengeance"
        case OATHBREAKER = "Oathbreaker"
        case TREACHERY = "Oath of Treachery"
        
        init?(id : Int) {
            switch id {
            case 1: self = .ANCIENTS
            case 2: self = .CONQUEST
            case 3: self = .CROWN
            case 4: self = .DEVOTION
            case 5: self = .REDEMPTION
            case 6: self = .VENGEANCE
            case 7: self = .OATHBREAKER
            case 8: self = .TREACHERY
            default: return nil
            }
        }
    }
    
    func levelPath(path : druPath){
        switch(path){
            
        case .CROWN :
            switch(super.playerLevel){
            case 6:
                classDescription.append("Spirit Shield: If you are raging and another creature you can see within 30 feet of you takes damage, you can use your reaction to reduce that damage by 2d6. When you reach certain levels in this class, you can reduce the damage by more: by 3d6 at 10th level and by 4d6 at 14th level.")
                fallthrough
            case 10:
                classDescription.append("Consult the Spirits: You cast the Augury or Clairvoyance spell, without using a spell slot or material components. Rather than creating a spherical sensor, it invisibly summons one of your ancestral spirits to the chosen location. Wisdom is your spellcasting ability for these spells. After you cast either spell in this way, you can't use this feature again until you finish a short or long rest.")
                fallthrough
            case 14:
                classDescription.append("Vengeful Ancestors: At 14th level, when you use your Spirit Shield to reduce the damage of an attack, the attacker takes an amount of force damage equal to the damage that your Spirit Shield prevents")
                fallthrough
            default :
                classDescription.append("Ancestral Protectors: While you're raging, the first creature you hit with an attack on your turn becomes the target of spiritual warriors, which hinder its attacks. Until the start of your next turn, that target has disadvantage on any attack roll that isn't against you, and when the target hits a creature other than you with an attack, that creature has resistance to the damage dealt by the attack. The effect on the target ends early if your rage ends.")
            }
        case .REDEMPTION :
            switch(super.playerLevel){
            case 6:
                classDescription.append("Reckless Abadon: Beginning at 6th level, when you use Reckless Attack while raging, you also gain temporary hit points equal to your Constitution modifier (minimum of 1). They vanish when your rage ends.")
                fallthrough
            case 10:
                classDescription.append("Battlerager Charge: You can take the Dash action as a bonus action while raging.")
                fallthrough
            case 14:
                classDescription.append("Spiked Retribution: When a creature within 5 feet of you hits you with a melee attack, the attacker takes 3 piercing damage if you are raging, aren't incapacitated, and are wearing spiked armor.")
                fallthrough
            default :
                classDescription.append("Battlerager Armor: You gain the ability to use Spiked Armor as a weapon. While you are wearing spiked armor and are raging, you can use a bonus action to make one melee weapon attack with your armor spikes against a target within 5 feet of you. If the attack hits, the spikes deal 1d4 piercing damage. You use your Strength modifier for the attack and damage rolls. Additionally, when you use the Attack action to grapple a creature, the target takes 3 piercing damage if your grapple check succeeds.")
            }
            
        case .OATHBREAKER :
            switch(self.playerLevel){
            case 6:
                classDescription.append("Mindless Rage: You can't be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage")
                fallthrough
            case 10:
                classDescription.append("Intimidating Presence: You can use your action to frighten someone. Choose one creature that you can see within 30 feet of you. If the creature can see or hear you, it must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier) or be frightened of you until the end of your next turn. On subsequent turns, you can use your action to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends if the creature ends its turn out of line of sight or more than 60 feet away from you. If the creature succeeds on its saving throw, you can't use this feature on that creature again for 24 hours.")
                fallthrough
            case 14:
                classDescription.append("Retaliation: When you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature. ")
                fallthrough
            default :
                classDescription.append("Frenzy: you can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When the rage ends you gain one level of exhaustion.")
            }
            
        default : return
        }
    }
    
}
