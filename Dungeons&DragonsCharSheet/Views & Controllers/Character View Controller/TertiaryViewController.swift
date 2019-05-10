//
//  TertiaryViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit
import CoreData

class TertiaryViewController: UIViewController {

    @IBOutlet weak var charInfo: UITextView!
    var infotext : [String]?
    var character : ClassEnt?
    var playerClass : Classes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charInfo.text = ""
        for text in infotext!{
            charInfo.text += text
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelUpBTN(_ sender: Any) {
        
        playerClass!.levelUp()
        print(String(playerClass!.health))
        alertNotifyUser(message: "Leveled Up!")
    }
    

    @IBAction func saveBTN(_ sender: Any) {
        
       updatePlayerClass()
        
        character!.update(playClass: playerClass!, className: playerClass!.className?.rawValue, subClass: nil)
        
        if let character = character {
                do {
                    print(String(playerClass!.health))
                    let managedContext = character.managedObjectContext
                    try managedContext?.save()
                } catch {
                    alertNotifyUser(message: "The document context could not be saved.")
                }
            } else {
                alertNotifyUser(message: "The document could not be created.")
            }
        
        //self.view.setNeedsDisplay()
        navigationController?.popViewController(animated: true)
        
    }

    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updatePlayerClass(){
        character!.maxHealth = Int16(playerClass!.health)
        character!.profBonus = Int16(playerClass!.profBonus)
        character!.ac = Int16(playerClass!.AC)
        character!.playerLevel = Int16(playerClass!.playerLevel)
        character!.chaFull = Int16(playerClass!.statArray[5])
        character!.wisFull = Int16(playerClass!.statArray[4])
        character!.intFull = Int16(playerClass!.statArray[3])
        character!.constFull = Int16(playerClass!.statArray[2])
        character!.dexFull = Int16(playerClass!.statArray[1])
        character!.strFull = Int16(playerClass!.statArray[0])
        character!.attackCount = Int16(playerClass!.attackCount)
        character!.strength = Int16(playerClass!.strMod)
        character!.dexterity = Int16(playerClass!.dexMod)
        character!.constitution = Int16(playerClass!.constMod)
        character!.intelligence = Int16(playerClass!.intMod)
        character!.wisdom = Int16(playerClass!.wisMod)
        character!.charisma = Int16(playerClass!.chaMod)
    }
    
}

