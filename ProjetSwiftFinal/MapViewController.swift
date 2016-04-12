//
//  RestaurationViewController.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 23/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locations : [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial location in Montpellier
        let initialLocation = CLLocation(latitude: 43.625, longitude: 3.8833)
        let regionRadius: CLLocationDistance = 2000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 4.0, regionRadius * 4.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(initialLocation)
        self.mapView.delegate = self
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //connection to the database
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Location") //request all the locations
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest) //execute the request
            self.locations = results as! [Location] //put the results in location
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        for i in locations{
            self.mapView.addAnnotation(i)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.tabBarController?.navigationItem.title = "Map of Montpellier"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
