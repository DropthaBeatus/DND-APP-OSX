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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //LabelArr = [strLabel, dexLabel, constLabel, intLabel, wisLabel, chaLabel]
        // Do any additional setup after loading the view.
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
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
        
        popvc.race = race
        popvc.subRace = subRace
        popvc.playerClass = playerClass
        popvc.statBlock = statBlock
        
        self.addChild(popvc)
        popvc.view.frame = self.view.frame
        self.view.addSubview(popvc.view)
        popvc.didMove(toParent: self)
        
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
    

}
