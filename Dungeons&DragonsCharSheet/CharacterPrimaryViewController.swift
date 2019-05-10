//
//  CharacterPrimaryViewController.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/8/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit
import CoreData

class CharacterPrimaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var docData:[ClassEnt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ClassEnt> = ClassEnt.fetchRequest()
        
        do{
            docData = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
            print(docData[0].name! + "\n\n\n\n")
        } catch {
            print("Could not fetch characters!")
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CharacterTableViewCell
        cell.NameLabel.text = docData[indexPath.row].name!
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCharacter(at: indexPath)
        }
    }
    
    
    func deleteCharacter(at indexPath: IndexPath) {
        let character = docData[indexPath.row]
        let row = indexPath.row
        if let managedObjectContext = character.managedObjectContext {
            managedObjectContext.delete(character)
            deleteData(index: row)
            do {
                try managedObjectContext.save()
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("Could not delete row")
            }
            
        }
        tableView.reloadData()
    }
    
    func deleteData(index: Int){
        docData.remove(at: index)
    }

    


}
