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
    
    
    var LabelArr : [UILabel]?
    var race : Race?
    var statBlock : [Int]?
    var subRace : String?
    var playerClass : Class?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let player = Character(raceTemp: race!, statBlock: statBlock!, subRaceTemp: subRace, classEnum : playerClass!)
        getRaceStats(char: player)
        LabelArr = [strLabel, dexLabel, constLabel, intLabel, wisLabel, chaLabel]
        loadUILabels(player: player)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
