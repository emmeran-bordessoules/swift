//
//  Activity.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 15/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import Foundation
import CoreData


class Activity: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!){
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    // return the day and the month of an activity
    func getDateActi(act: Activity) -> String{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        let day = dateFormatter.stringFromDate(act.dateActivity!)
        
        return day
    }
}