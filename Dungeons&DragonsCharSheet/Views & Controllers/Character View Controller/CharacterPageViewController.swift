//
//  CharacterPageViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class CharacterPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Character", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }

    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "primary"),
                self.newVc(viewController: "secondary"),
                self.newVc(viewController: "tertiary")]
    }()
    
    var character : ClassEnt?
    var playerClass : Classes?
    
    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }

    }

    func setUI(){
        
        let first = orderedViewControllers[0] as! FirstCharViewController
          let second = orderedViewControllers[1] as! SecondViewController
        let third = orderedViewControllers[2] as! TertiaryViewController
        
        
        switch(playerClass?.className!.rawValue){
                case "Barbarian":
                    let classP = playerClass as! Barbarian
                    first.playerClass = classP
                    second.AC = classP.AC
                    second.ProfBonus = classP.profBonus
                    second.skillNum = classP.skillArray
                    third.infotext = classP.classDescription
                    third.character = character
                    third.playerClass = classP
                  //  for block in classP.classDescription{
                   //     third.block
                   // }
               // case "Bard":
               // case "Cleric":
               case "Druid":
                    let classP = playerClass as! Druid
                    first.playerClass = playerClass
                    second.AC = classP.AC
                    second.ProfBonus = classP.profBonus
                    second.skillNum = classP.skillArray
                    third.infotext = classP.classDescription
                    third.character = character
                    third.playerClass = classP
               // case "Fighter":
               // case "Monk":
                case "Paladin":
                    let classP = playerClass as! Paladin
                    first.playerClass = playerClass
                    second.AC = classP.AC
                    second.ProfBonus = classP.profBonus
                    second.skillNum = classP.skillArray
                    third.infotext = classP.classDescription
                    third.character = character
                    third.playerClass = classP
              //  case "Ranger":
               // case "Rouge":
              //  case "Sorcerer":
              //  case "Warlock":
              //  case "Wizard":
                default :
                    _ = playerClass
            
            }
        
        
       
        
        //.infotext = playerBarb.classDescription[0]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }


}
