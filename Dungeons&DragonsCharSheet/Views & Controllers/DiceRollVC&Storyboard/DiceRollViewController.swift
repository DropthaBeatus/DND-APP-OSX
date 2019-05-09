//
//  DiceRollViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/8/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class DiceRollViewController: UIViewController {

//    CoinFlip (CF)
    @IBOutlet weak var CFNumLabel: UILabel!
    @IBOutlet weak var CFTotalLabel: UILabel!
    
//      D4
    @IBOutlet weak var D4NumLabel: UILabel!
    @IBOutlet weak var D4TotalLabel: UILabel!
    
//      D6
    @IBOutlet weak var D6NumLabel: UILabel!
    @IBOutlet weak var D6TotalLabel: UILabel!

//      D8
    @IBOutlet weak var D8NumLabel: UILabel!
    @IBOutlet weak var D8TotalLabel: UILabel!
    
//      D10
    
    @IBOutlet weak var D10NumLabel: UILabel!
    @IBOutlet weak var D10TotalLabel: UILabel!
    
//      D12
    @IBOutlet weak var D12NumLabel: UILabel!
    @IBOutlet weak var D12TotalLabel: UILabel!
    
//      D20
    @IBOutlet weak var D20NumLabel: UILabel!
    @IBOutlet weak var D20TotalLabel: UILabel!
    
//      D100
    @IBOutlet weak var D100NumLabel: UILabel!
    @IBOutlet weak var D100TotalLabel: UILabel!
    
    var cfNum = 0
    var d4Num = 0
    var d6Num = 0
    var d8Num = 0
    var d10Num = 0
    var d12Num = 0
    var d20Num = 0
    var d100Num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func CFMinusBTN(_ sender: Any) {
        if(cfNum > 0){
            cfNum -= 1
            CFNumLabel.text = String(cfNum)
        }
    }
    
    @IBAction func CFAddBTN(_ sender: Any) {
        if(cfNum < 10){
            cfNum += 1
            CFNumLabel.text = String(cfNum)
        }
        
    }
    
    @IBAction func D4MinusBTN(_ sender: Any) {
        if(d4Num > 0){
            d4Num -= 1
            D4NumLabel.text = String(d4Num)
        }
    }
    
    
    @IBAction func D4AddBTN(_ sender: Any) {
        if(d4Num < 10){
            d4Num += 1
            D4NumLabel.text = String(d4Num)
        }
    }
    
    @IBAction func D6MinusBTN(_ sender: Any) {
        if(d6Num > 0){
            d6Num -= 1
            D6NumLabel.text = String(d6Num)
        }
    }
    
    @IBAction func D6AddBTn(_ sender: Any) {
        if(d6Num < 10){
            d6Num += 1
            D6NumLabel.text = String(d6Num)
        }
    }
    
    @IBAction func D8MinusBTN(_ sender: Any) {
        if(d8Num > 0){
            d8Num -= 1
            D8NumLabel.text = String(d8Num)
        }
    }
    
    @IBAction func D8AddBTN(_ sender: Any) {
        if(d8Num < 10){
            d8Num += 1
            D8NumLabel.text = String(d8Num)
        }
    }
    
    @IBAction func D10MinusBTN(_ sender: Any) {
        if(d10Num > 0){
            d10Num -= 1
            D10NumLabel.text = String(d10Num)
        }
    }
    @IBAction func D10AddBTN(_ sender: Any) {
        if(d10Num < 10){
            d10Num += 1
            D10NumLabel.text = String(d10Num)
        }
    }
    
    @IBAction func D12MinusBTN(_ sender: Any) {
        if(d12Num > 0){
            d12Num -= 1
            D12NumLabel.text = String(d12Num)
        }
    }
    @IBAction func D12AddBTN(_ sender: Any) {
        if(d12Num < 10){
            d12Num += 1
            D12NumLabel.text = String(d12Num)
        }
    }
    
    
    @IBAction func D20MinusBTN(_ sender: Any) {
        if(d20Num > 0){
            d20Num -= 1
            D20NumLabel.text = String(d20Num)
        }
    }
    @IBAction func D20AddBTN(_ sender: Any) {
        if(d20Num < 10){
            d20Num += 1
            D20NumLabel.text = String(d20Num)
        }
    }
    
    @IBAction func D100MinusBTN(_ sender: Any) {
        if(d100Num > 0){
            d100Num -= 1
            D100NumLabel.text = String(d100Num)
        }
    }
    
    @IBAction func D100AddBTN(_ sender: Any) {
        if(d100Num < 10){
            d100Num += 1
            D100NumLabel.text = String(d100Num)
        }
    }
    
    
    @IBAction func RollDiceBTN(_ sender: Any) {
        CFTotalLabel.text = String(coinFlip(cfNum))
        D4TotalLabel.text = String(dFour(d4Num))
        D6TotalLabel.text = String(dSix(d6Num))
        D8TotalLabel.text = String(dEight(d8Num))
        D10TotalLabel.text = String(dTen(d10Num))
        D12TotalLabel.text = String(dTwelve(d12Num))
        D20TotalLabel.text = String(dTwenty(d20Num))
        D100TotalLabel.text = String(dHundred(d100Num))
    }
    
}
