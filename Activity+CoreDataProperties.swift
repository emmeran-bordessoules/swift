//
//  Activity+CoreDataProperties.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 15/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activity {

    @NSManaged var activityChoosen: NSNumber?
    @NSManaged var dateActivity: NSDate?
    @NSManaged var descriptionActivity: String?
    @NSManaged var nameActivity: String?
    @NSManaged var actloc: Location?
    @NSManaged var actspeak: NSSet?

}
