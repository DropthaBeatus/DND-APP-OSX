//
//  RollStatsViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class RollStatsViewController: UIViewController {

    @IBOutlet weak var strLabel: UILabel!
    
    @IBOutlet weak var dexLabel: UILabel!
    
    @IBOutlet weak var constLabel: UILabel!
    
    @IBOutlet weak var intLabel: UILabel!
    
    @IBOutlet weak var wisLabel: UILabel!
    
    @IBOutlet weak var chaLabel: UILabel!
    
    var LabelArr : [UILabel]?
    
    var statBlock : [Int]?
    var race : Race?
    var subRace : String?
    var playerClass : Class?
    var playerName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollStats(1)
    }
    
    @IBAction func rollStats(_ sender: Any) {
        statBlock = rollThreeDSixes()
        LabelArr = [strLabel, dexLabel, constLabel, intLabel, wisLabel, chaLabel]
        for x in 0...statBlock!.count-1{
            LabelArr?[x].text = String(statBlock![x])
        }
    }
    
    @IBAction func `continue`(_ sender: Any) {

        
        playerName = playerName!.trimmingCharacters(in: .whitespaces)
        let ClassCreation = returnSpecificClass(className: playerClass!.rawValue, levelTemp: 1, statBlockTemp: statBlock!, RaceTemp: race!, subRaceTemp: subRace, name : playerName!)
        
        print()
        let playerSaveData = ClassEnt(playClass: ClassCreation, className: playerClass!.rawValue, subClass: nil)
        
        if let playerSaveData = playerSaveData {
            do {
                let managedContext = playerSaveData.managedObjectContext
                try managedContext?.save()
            } catch {
                alertNotifyUser(message: "The document context could not be saved.")
            }
        }
        else{
                alertNotifyUser(message: "The document could not be created.")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }


}
