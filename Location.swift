//
//  Location.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 15/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import Foundation
import CoreData
import MapKit


class Location: NSManagedObject, MKAnnotation {

// Insert code here to add functionality to your managed object subclass
    //return the coordinates with the string of the adress location
    var coordinate: CLLocationCoordinate2D {
        let coor = adressLocation!.componentsSeparatedByString(",")
        let tmp1 = Double(coor[0])
        let tmp2 = Double(coor[1])
        return CLLocationCoordinate2D(latitude: tmp1!, longitude: tmp2!)
    }
    
    var title: String? {
        return nameLocation!
    }

}
