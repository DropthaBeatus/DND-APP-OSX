//
//  Barbarian.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import Foundation

class Barbarian : Classes {
   // var level : Int
    var rageCount = "2"
    var rageDamange = 2
    var attackCount = 1
    var path : barbPath?

    
    //will obvisouly need to implement more here
    override init(level : Int, classEnum : Class, statBlock : [Int]){

        super.init(level: level, classEnum: classEnum, statBlock: statBlock)
        unarmoredDefense()
        super.classDescription?.append("Rage : On your turn, you can enter a rage as a bonus action. While raging, you gain the following benefits if you aren't wearing heavy armor: You have advantage on all Strength checks and Strength saving throws. When you make a melee weapon attack using Strength, you gain a bonus to the damage roll that increases as you gain levels as a barbarian, as shown in the Rage Damage column of the Barbarian table.You have resistance to bludgeoning, piercing, and slashing damage.If you are able to cast spells, you can't cast them or concentrate on them while raging. Your rage lasts for 1 minute. It ends early if you are knocked unconscious or if your turn ends and you haven't attacked a hostile creature since your last turn or taken damage since then. You can also end your rage on your turn as a bonus action. Once you have raged the number of times shown for your barbarian level in the Rages column of the Barbarian table, you must finish a long rest before you can rage again. ")
        super.health = setMaxHealth(health: super.health, constMod: super.constMod)
        //setModSave()
    }
    
    override func levelUp() {
        super.levelUp()
        prepareLevel(super.classLvl)
        unarmoredDefense()
        //need to call health here
    }
    
    //should do a roll mechanic here
    func setHealth(health : Int, constMod : Int)-> Int{
        let HP = health + constMod + dTwelve(1)
        
        return HP
    }
    
    func setMaxHealth(health : Int, constMod : Int)-> Int{
        let HP = health + constMod + 12
        
        return HP
    }
    
    func setAverageHealth(health : Int, constMod : Int)-> Int{
        let HP = health + constMod + 7
        
        return HP
    }
    
    func prepareLevel(_ level : Int){
        switch(level){
            case 2:
                super.classDescription?.append("Reckless Attack: When you make your first attack on your turn, you can decide to attack recklessly. Doing so gives you advantage on all melee weapon attack rolls using Strength during that turn, but attack rolls against you are rolled with advantage until the beginning of your next turn")
                super.classDescription?.append("Danger Sense : At 2nd level, you have advantage on Dexterity saving throws against effects that you can see, such as traps or spells. You do not gain this benefit if you are blinded, deafened, or incapacitated")
            case 3:
                setRageCount("3")
                //choosePath()
                levelPath(path: .ANCESTRAL)
            case 4:
                super.needsAbilityImprovement = true
                attackCount = 2
                super.classDescription?.append("You can attack twice, instead of once, whenever you take the Attack action on your turn.")
                super.classDescription?.append("Your speed increases by 10 feet while you aren't wearing heavy armor. ")
            case 5:
                setProfBonus(3)
            case 6:
                setRageCount("4")
                levelPath(path: .ANCESTRAL)
            case 7:
                super.classDescription?.append("Feral Instinct: You have advantage on initiative rolls. Additionally, if you are surprised at the beginning of combat and aren't incapacitated, you can act normally on your first turn, but only if you enter your rage before doing anything else on that turn.")
            case 8:
                super.needsAbilityImprovement = true
            case 9:
                super.classDescription?.append("Brutal Attack: you can roll one additional weapon damage die when determining the extra damage for a critical hit with a melee attack.This increases to two additional dice at 13th level and three additional dice at 17th level. ")
                setRageDamage(3)
                setProfBonus(4)
            case 10:
                levelPath(path: .ANCESTRAL)
            case 11:
                super.classDescription?.append("Relentless Rage: if you drop to 0 hit points while you're raging and don't die outright, you can make a DC 10 Constitution saving throw. If you succeed, you drop to 1 hit point instead. Each time you use this feature after the first, the DC increases by 5. When you finish a short or long rest, the DC resets to 10.")
            case 12:
                super.needsAbilityImprovement = true
                setRageCount("5")
                setProfBonus(5)
            //case 13:
            
            case 14:
                levelPath(path: .ANCESTRAL)
            case 15:
                super.classDescription?.append("Persistent Rage: Your rage ends early only if you fall unconscious or if you choose to end it.")
            case 16:
                super.needsAbilityImprovement = true
                setRageDamage(4)
            case 17:
                setRageCount("6")
                setProfBonus(6)
            case 18:
                super.classDescription?.append("Beginning at 18th level, if your total for a Strength check is less than your Strength score, you can use that score in place of the total.")
            case 19:
                super.needsAbilityImprovement = true
            case 20:
                super.statArray[2] = statArray[2]+4
                super.statArray[0] = statArray[0]+4
                setRageCount("INFINITE")
         default:
            return
         
        }
    }
    
    func unarmoredDefense(){
        let mod = getModifier(super.statArray[1]) + getModifier(super.statArray[2])
        super.AC = (10 + mod)
    }
    
    func setRageCount(_ count : String){
        self.rageCount = count
    }
    
    func setRageDamage(_ count : Int){
        self.rageDamange = count
    }
    

    
    override func setModSave(){
        super.strModSave = super.strMod + profBonus
        super.dexModSave = super.dexMod
        super.constModSave = super.constMod + profBonus
        super.intModSave = super.intMod
        super.wisModSave = super.wisMod
        super.chaModSave = super.chaMod
        
    }
    
    enum barbPath : String, CaseIterable{
    case ANCESTRAL = "Path of the Ancestral Guardian"
    case BATTLERAGER = "Path of the Battlerager"
    case BESERKER = "Path of the Berserker"
    case STORM = "Path of the Storm Herald"
    case TOTEM = "Path of the Totem Warrior"
    case ZEALOT = "Path of the Zealot"

        init?(id : Int) {
            switch id {
                case 1: self = .ANCESTRAL
                case 2: self = .BATTLERAGER
                case 3: self = .BESERKER
                case 4: self = .STORM
                case 5: self = .TOTEM
                case 6: self = .ZEALOT
                default: return nil
            }
        }
    }
    
    func levelPath(path : barbPath){
        switch(path){
        case .ANCESTRAL :
            switch(self.classLvl){
                case 6:
                    super.classDescription?.append("Spirit Shield: If you are raging and another creature you can see within 30 feet of you takes damage, you can use your reaction to reduce that damage by 2d6. When you reach certain levels in this class, you can reduce the damage by more: by 3d6 at 10th level and by 4d6 at 14th level.")
                case 10:
                    super.classDescription?.append("Consult the Spirits: You cast the Augury or Clairvoyance spell, without using a spell slot or material components. Rather than creating a spherical sensor, it invisibly summons one of your ancestral spirits to the chosen location. Wisdom is your spellcasting ability for these spells. After you cast either spell in this way, you can't use this feature again until you finish a short or long rest.")
                case 14:
                    super.classDescription?.append("Vengeful Ancestors: At 14th level, when you use your Spirit Shield to reduce the damage of an attack, the attacker takes an amount of force damage equal to the damage that your Spirit Shield prevents")
                default :
                    super.classDescription?.append("Ancestral Protectors: While you're raging, the first creature you hit with an attack on your turn becomes the target of spiritual warriors, which hinder its attacks. Until the start of your next turn, that target has disadvantage on any attack roll that isn't against you, and when the target hits a creature other than you with an attack, that creature has resistance to the damage dealt by the attack. The effect on the target ends early if your rage ends.")
            }
        case .BATTLERAGER :
            switch(self.classLvl){
            case 6:
                super.classDescription?.append("Reckless Abadon: Beginning at 6th level, when you use Reckless Attack while raging, you also gain temporary hit points equal to your Constitution modifier (minimum of 1). They vanish when your rage ends.")
            case 10:
                super.classDescription?.append("Battlerager Charge: You can take the Dash action as a bonus action while raging.")
            case 14:
                super.classDescription?.append("Spiked Retribution: When a creature within 5 feet of you hits you with a melee attack, the attacker takes 3 piercing damage if you are raging, aren't incapacitated, and are wearing spiked armor.")
            default :
                super.classDescription?.append("Battlerager Armor: You gain the ability to use Spiked Armor as a weapon. While you are wearing spiked armor and are raging, you can use a bonus action to make one melee weapon attack with your armor spikes against a target within 5 feet of you. If the attack hits, the spikes deal 1d4 piercing damage. You use your Strength modifier for the attack and damage rolls. Additionally, when you use the Attack action to grapple a creature, the target takes 3 piercing damage if your grapple check succeeds.")
            }
        case .BESERKER :
            switch(self.classLvl){
            case 6:
                super.classDescription?.append("Mindless Rage: You can't be charmed or frightened while raging. If you are charmed or frightened when you enter your rage, the effect is suspended for the duration of the rage")
            case 10:
                super.classDescription?.append("Intimidating Presence: You can use your action to frighten someone. Choose one creature that you can see within 30 feet of you. If the creature can see or hear you, it must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier) or be frightened of you until the end of your next turn. On subsequent turns, you can use your action to extend the duration of this effect on the frightened creature until the end of your next turn. This effect ends if the creature ends its turn out of line of sight or more than 60 feet away from you. If the creature succeeds on its saving throw, you can't use this feature on that creature again for 24 hours.")
            case 14:
                super.classDescription?.append("Retaliation: When you take damage from a creature that is within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature. ")
            default :
                super.classDescription?.append("Frenzy: you can go into a frenzy when you rage. If you do so, for the duration of your rage you can make a single melee weapon attack as a bonus action on each of your turns after this one. When the rage ends you gain one level of exhaustion.")
            }

        default : return
        }
    }

}
