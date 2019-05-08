//
//  testViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 4/26/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = [10,15,15,15,15,10]
        
        //let barb = Character(raceTemp: .HUMAN, statBlock: test, subRaceTemp: nil)
        let barb = Barbarian(level: 1, statBlock: test, raceTemp: .HUMAN, subRaceTemp: nil)
        printstuff(bb: barb)
    
        
        // Do any additional setup after loading the view.
    }
    

    
    func printstuff(bb : Classes){
        print(bb.AC)
       // print(bb.classDescription)
        print(bb.statArray)
    }


}
