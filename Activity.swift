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
    
    
    func getDateActi(act: Activity) -> String{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        let tmp1 = dateFormatter.stringFromDate(act.dateActivity!)
        
        return tmp1
    }
    
    /*func getSectionItems(section: Int) -> [Activity] {
        var sectionItems = [Activity]()
        
        // loop through the testArray to get the items for this sections's date
        for item in testArry {
            let dateTextItem = item as DateTextItem
            let df = NSDateFormatter()
            df.dateFormat = "MM/dd/yyyy"
            let dateString = df.stringFromDate(dateTextItem.insertDate)
            
            // if the item's date equals the section's date then add it
            if dateString == sectionsInTable[section] as NSString {
                sectionItems.append(dateTextItem)
            }
        }
        
        return sectionItems
    }*/
    
}