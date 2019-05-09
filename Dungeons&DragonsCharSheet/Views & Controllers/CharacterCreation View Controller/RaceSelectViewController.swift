//
//  RaceSelectViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 10/27/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class RaceSelectViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var RacePicker: UIPickerView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    let classesArr : [Class] = getAllClasses()
    let racesArr : [Race] = getAllRaces()
    var choosenRace : Race?
    var subRaceArr : [String]?
    var choosenSubRace : String?
    var choosenClass : Class?
    var readytoPickClass : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.RacePicker.delegate = self
        self.RacePicker.dataSource = self
        showAnimate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //let subRace = UIPickerView(frame: )
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(subRaceArr != nil && readytoPickClass == false){
            return (subRaceArr?.count)!
        }
        else if(readytoPickClass){
            choosenClass = classesArr[0]
            return classesArr.count
        }
        else{
            //need to find a better way to instatiate 
            choosenRace = racesArr[0]
            return racesArr.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String?{
            if(subRaceArr != nil && readytoPickClass == false){
                return (subRaceArr?[row])!
            }
            else if(readytoPickClass){
                return classesArr[row].rawValue
            }
            else{
                return String(racesArr[row].rawValue)
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(subRaceArr != nil && readytoPickClass == false){
            choosenSubRace = (subRaceArr?[row])!
        }
        else if(readytoPickClass){
            choosenClass = classesArr[row]
        }
        else{
            choosenRace = racesArr[row]
        }
        
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
    
    @IBAction func selectBTN(_ sender: Any) {
        subRaceArr = SubRace(race : choosenRace!)
        let popvc = UIStoryboard(name: "CharacterCreation", bundle: nil).instantiateViewController(withIdentifier: "RollStatsViewController") as! RollStatsViewController
        
        
        if( subRaceArr == nil && choosenSubRace == nil && choosenClass == nil){
            readytoPickClass = true
            RacePicker.reloadAllComponents()
        }
        else if(subRaceArr != nil && choosenSubRace == nil){
            RacePicker.reloadAllComponents()
        }
        else if(subRaceArr != nil && choosenSubRace != nil){
            readytoPickClass = true
            RacePicker.reloadAllComponents()
        }
        else if(choosenClass != nil){
            if(NameTextField.text == "" || NameTextField.text == nil){
                print("working!")
                let alertController = UIAlertController(title: "Name Needed!", message:
                    "Please Enter a name for your new Adventurer", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                print("not working!")
                //will need to segue instead of pop
                
                popvc.race = choosenRace
                popvc.subRace = choosenSubRace
                popvc.playerClass = choosenClass
                popvc.playerName = NameTextField.text! //navigationController?.pushViewController(popvc, animated: true)
                self.addChild(popvc)
                popvc.view.frame = self.view.frame
                self.view.addSubview(popvc.view)
                popvc.didMove(toParent: self)

            }
            
        }
    }
    
    
}
