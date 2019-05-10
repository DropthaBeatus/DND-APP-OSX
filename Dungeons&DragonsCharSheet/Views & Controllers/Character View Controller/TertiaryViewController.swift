//
//  TertiaryViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class TertiaryViewController: UIViewController {

    @IBOutlet weak var charInfo: UITextView!
    var infotext : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charInfo.text = ""
        for text in infotext!{
            charInfo.text += text
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelUpBTN(_ sender: Any) {
    }
    

    @IBAction func saveBTN(_ sender: Any) {
    }
    
}
