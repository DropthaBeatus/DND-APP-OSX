//
//  SecondViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var acLabel: UILabel!
    @IBOutlet weak var profLabel: UILabel!
    

    @IBOutlet weak var skillTabelView: UITableView!

    var skillNum : [Int]?
    var AC : Int?
    var ProfBonus : Int?
    let skillStrings = ["Athletics", "Acrobatics", "Sleight Of Hand", "Stealth", "Arcana", "History", "Investigation", "Nature", "Religion", "Animal Handling", "Insight", "Medicine", "Perception", "Survival", "Deception", "Intimidation", "Performance", "Persuasion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skillTabelView.delegate = self
        self.skillTabelView.dataSource = self
        acLabel.text = String(AC!)
        profLabel.text = String(ProfBonus!)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillNum!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillcell") as! SkillTableViewCell
        cell.skillNameLabel.text = skillStrings[indexPath.row]
        
        cell.skillNumLabel.text = String(skillNum![indexPath.row])
        return cell
    }
    

}
