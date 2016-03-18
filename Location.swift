//
//  Location.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 15/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import Foundation
import CoreData


class Location: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func getLocationActi(loc: Location)->String{
        return loc.adressLocation!
    }

}
