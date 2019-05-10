//
//  FirstCharViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class FirstCharViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var statTableView: UITableView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    let StatName = ["Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"]
    var playerClass : Classes?
    var saveArr = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statTableView.delegate = self
        self.statTableView.dataSource = self
        NameLabel.text = playerClass!.name
        healthLabel.text = String(playerClass!.health)
        classLabel.text = playerClass!.className!.rawValue
        raceLabel.text = playerClass!.race.rawValue
        print(playerClass!.statArray)
        saveArr.append(playerClass!.strModSave)
        saveArr.append(playerClass!.dexModSave)
        saveArr.append(playerClass!.constModSave)
        saveArr.append(playerClass!.intModSave)
        saveArr.append(playerClass!.wisModSave)
        saveArr.append(playerClass!.chaModSave)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statcell") as! StatBlocksTableViewCell
        cell.StatName.text = StatName[indexPath.row]
        cell.BonusNum.text = String(getModifier(playerClass!.statArray[indexPath.row]))
        cell.flatNum.text = String(playerClass!.statArray[indexPath.row])
        cell.SaveNum.text = String(saveArr[indexPath.row])
        
        return cell
    }
    
    


}
