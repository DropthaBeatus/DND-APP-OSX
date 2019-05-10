//
//  Druid.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import Foundation

class Druid : Classes {

    var path : druPath?
    var classDescription = [String]()
    
    init(level : Int, statBlock statBlockT: [Int], raceTemp raceTempT : Race, subRaceTemp subRaceTempT : String?, nameTemp: String, health : Int?){
        super.init(level: level, statBlock: statBlockT, raceTemp: raceTempT, subRaceTemp: subRaceTempT, nameTemp: nameTemp)
        super.className = Class.init(id: "Druid")
        
        classDescription.append("Druidic - You know Druidic, the Secret language of druids. You can speak the language and use it to leave hidden messages. You and others who know this language automatically spot such a Message. Others spot the message's presence with a successful DC 15 Wisdom (Perception) check but can't decipher it without magic.")
        if(level == 1){
            super.health = self.constMod + 12
        }
        else{
            super.health = health!
        }
        super.playerLevel = level
        var x = 0
        while(x < level){
            prepareLevel(x)
            x += 1
        }
        setModSave()
    }
    
    
    override func levelUp(){
        if(self.playerLevel < 21){
            super.levelUp()
            prepareLevel(super.playerLevel)
            setAverageHealth()
        }
    }
    
    func setHealth(){
        health = self.health + self.constMod + dEight(1)
    }
    
    
    func setMaxHealth(){
        health = self.health + self.constMod + 8
    }
    
    func setAverageHealth(){
        health = self.health + self.constMod + 4
    }
    
    
    func prepareLevel(_ playerLevel : Int){
        switch(playerLevel){
            case 2:
            classDescription.append("Wild Shape - Starting at 2nd level, you can use your action to magically assume the shape of a beast that you have seen before. You can use this feature twice. You regain expended uses when you finish a short or Long Rest. Your druid level determines the Beasts you can transform into, as shown in the Beast Shapes table. At 2nd level, for example, you can transform into any beast that has a Challenge rating of 1/4 or lower that doesn't have a flying or swimming speed.You can stay in a beast shape for a number of hours equal to half your druid level (rounded down). You then revert to your normal form unless you expend another use of this feature. You can revert to your normal form earlier by using a Bonus Action on Your Turn. You automatically revert if you fall Unconscious, drop to 0 Hit Points, or die.\n\n")
            case 3:
                classDescription.append("By 3rd level, the divine magic flowing through you makes you immune to disease\n\n")
                levelPath(path: .LAND)
            case 4:
                super.needsAbilityImprovement = true
            case 5:
            super.attackCount = 2
                setProfBonus(3)
            case 6:
                levelPath(path: .LAND)
                classDescription.append("Land's Stride - Starting at 6th level, moving through nonmagical difficult terrain costs you no extra Movement. You can also pass through nonmagical Plants without being slowed by them and without taking damage from them if they have thorns, spines, or a similar hazard. In addition, you have advantage on Saving Throws against Plants that are magically created or manipulated to impede Movement, such those created by the Entangle spell.\n\n")
            //case 7:
            case 8:
            super.needsAbilityImprovement = true
            case 9:
            classDescription.append("Brutal Attack: you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.This increases to two additional dice at 13th level and three additional dice at 17th level. ")
            setProfBonus(4)
            case 10:
            classDescription.append("When you reach 10th level, you can’t be Charmed or Frightened by Elementals or fey, and you are immune to poison and disease./n/n")
            levelPath(path: .LAND)
            case 11:
            classDescription.append("By 11th level, whenever you hit a creature with a melee weapon, the creature takes an extra 1d8 radiant damage./n/n")
            case 12:
            super.needsAbilityImprovement = true
            setProfBonus(5)
            //  case 13:
            
            case 14:
            classDescription.append("Nature's Sanctuary - When you reach 14th level, creatures of the natural world sense your connection to Nature and become hesitant to Attack you. When a beast or plant creature attacks you, that creature must make a Wisdom saving throw against your druid spell save DC. On a failed save, the creature must choose a different target, or the Attack automatically misses. On a successful save, the creature is immune to this effect for 24 hours.The creature is aware of this effect before it makes its Attack against you.\n\n")
            levelPath(path: .LAND)
            //  case 15:
            case 16:
            super.needsAbilityImprovement = true
            case 17:
            setProfBonus(6)
            case 18:
            classDescription.append("Timeless Body - Starting at 18th level, the primal magic that you wield causes you to age more slowly. For every 10 years that pass, your body ages only 1 year.")
            classDescription.append("Beast Spells - Beginning at 18th level, you can cast many of your Druid Spells in any shape you assume using Wild Shape. You can perform the somatic and verbal Components of a druid spell while in a beast shape, but you aren't able to provide material Components.\n\n")
            case 19:
            super.needsAbilityImprovement = true
            case 20:
            classDescription.append("Archdruid - At 20th level, you can use your Wild Shape an unlimited number of times.Additionally, you can ignore the verbal and somatic Components of your Druid Spells, as well as any material Components that lack a cost and aren't consumed by a spell. You gain this benefit in both your normal shape and your beast shape from Wild Shape.\n\n")
            
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
        case DREAMS = "Cirlce of Dreams"
        case LAND = "Cirlce of Land"
        case MOON = "Cirlce of Moon"
        
        init?(id : Int) {
            switch id {
            case 1: self = .DREAMS
            case 2: self = .LAND
            case 3: self = .MOON
            default: return nil
            }
        }
    }

    func levelPath(path : druPath){
        switch(path){
            
        case .DREAMS :
            switch(self.playerLevel){
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
        case .LAND :
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
            
        case .MOON :
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


