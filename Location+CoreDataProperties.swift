//
//  Location+CoreDataProperties.swift
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

extension Location {

    @NSManaged var adressLocation: String?
    @NSManaged var nameLocation: String?
    @NSManaged var actloc: NSSet?
    
    
}
