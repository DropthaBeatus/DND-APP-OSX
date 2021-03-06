//
//  ClassEnt+CoreDataProperties.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/9/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//
//

import Foundation
import CoreData


extension ClassEnt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassEnt> {
        return NSFetchRequest<ClassEnt>(entityName: "ClassEnt")
    }

    @NSManaged public var maxHealth: Int16
    @NSManaged public var name: String?
    @NSManaged public var ac: Int16
    @NSManaged public var profBonus: Int16
    @NSManaged public var attackCount: Int16
    @NSManaged public var playerLevel: Int16
    @NSManaged public var raceString: String?
    @NSManaged public var subRaceString: String?
    @NSManaged public var strength: Int16
    @NSManaged public var dexterity: Int16
    @NSManaged public var constitution: Int16
    @NSManaged public var wisdom: Int16
    @NSManaged public var intelligence: Int16
    @NSManaged public var charisma: Int16
    @NSManaged public var classDNDName: String?
    @NSManaged public var subClassDNDName: String?

}
