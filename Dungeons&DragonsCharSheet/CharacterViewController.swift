//
//  CharacterViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var raceLabel: UILabel!
    
    @IBOutlet weak var subRaceLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var strLabel: UILabel!
    
    @IBOutlet weak var dexLabel: UILabel!
    
    @IBOutlet weak var constLabel: UILabel!
    
    @IBOutlet weak var intLabel: UILabel!
    
    @IBOutlet weak var wisLabel: UILabel!
    
    @IBOutlet weak var chaLabel: UILabel!
    
    @IBOutlet weak var test: UITextView!
    
    var LabelArr : [UILabel]?
    var race : Race?
    var statBlock : [Int]?
    var subRace : String?
    var playerClass : Class?
    var testString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let clas1 = classSelectandCreate(playerClass: playerClass!)
        let player = Character(raceTemp: race!, statBlock: statBlock!, subRaceTemp: subRace)
        getRaceStats(char: player)
        LabelArr = [strLabel, dexLabel, constLabel, intLabel, wisLabel, chaLabel]
        loadUILabels(player: player)
        for x in 0...player.skillArray.count-1{
            testString += String(player.skillArray[x]) + "\n"
        }
        player.playerClasses?.append(clas1)
        //player.transferFromClasses()
        testString += "AC: " + String(clas1.AC)//String(player.playerClasses![0].health)
        test.text = testString
    }
    
    func loadUILabels(player : Character){
        for x in 0...player.statArray.count-1{
            LabelArr?[x].text = String(player.statArray[x])
        }
        
        raceLabel.text = player.race.rawValue
        if(player.subRace != nil){
            subRaceLabel.text = player.subRace
        }
        classLabel.text = playerClass?.rawValue
        
    }
    
    func classSelectandCreate(playerClass : Class)->Classes{
        switch(playerClass){
        case .BARBARIAN:
            return Barbarian(level: 1, classEnum: playerClass, statBlock: statBlock!)
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
            return Classes(level: 1, classEnum: playerClass, statBlock: statBlock!)
        }
    }
    
    func classSelectandLevel(playerClass : Classes){
        switch(playerClass.classEnum){
        case .BARBARIAN:
            playerClass.levelUp()
            //need a way to setup a way for ability improvement
           // statArray = playerClass.statArray
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
