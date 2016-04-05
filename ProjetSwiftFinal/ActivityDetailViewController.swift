//
//  ActivityDetailViewController.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 14/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit
import CoreData
import MapKit



class ActivityDetailViewController: UIViewController,UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource {
    
    @IBOutlet weak var heureActi: UILabel!
    @IBOutlet weak var dateActi: UILabel!
    @IBOutlet weak var titreActivity: UILabel!
    @IBOutlet weak var descActivity: UILabel!
    var acti : Activity!
    var speaker=[Speaker]()
    
    @IBOutlet weak var tableSP: UITableView!
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var switchState: UISwitch!
    
    @IBAction func saveButton(sender: UISwitch) {
                
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Activity")
        fetchRequest.predicate = NSPredicate(format: "nameActivity = %@", acti.nameActivity!)
        
        
        var res : NSManagedObject
        var results: NSArray
        
        if switchState.on {
            switchState.setOn(true, animated:true)
                    do {
                        try results =  managedContext.executeFetchRequest(fetchRequest) as! [Activity]
                        res = results [0] as! NSManagedObject
                        res.setValue(true, forKey: "activityChoosen")// put the boolean to true in the core data
                    } catch {
                        print("Error request")
                    }
                    
                    do {
                        try managedContext.save()
                    }
                    catch {
                        print("No save")
                    }
            }
        else {
            switchState.setOn(false, animated:false)
                    do {
                        try results =  managedContext.executeFetchRequest(fetchRequest) as! [Activity]
                        res = results [0] as! NSManagedObject
                        res.setValue(false, forKey: "activityChoosen")// put the boolean to false in the core data
                    } catch {
                        print("Error request")
                    }
                    
                    do {
                        try managedContext.save()
                    }
                    catch {
                        print("No save")
                    }
            }
        self.reloadInputViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.addAnnotation(self.acti.actloc!)
        
        // set initial location in Montpellier
        let initialLocation = CLLocation(latitude: 43.63, longitude: 3.866)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 4.0, regionRadius * 4.0)
            map.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(initialLocation)
        map.delegate = self

        self.titreActivity.text = acti.nameActivity
        self.descActivity.text = acti.descriptionActivity
        
        let dateFormatter = NSDateFormatter()//date with day month format
        dateFormatter.dateFormat = "dd-MM"
        let tmp1 = dateFormatter.stringFromDate(acti.dateActivity!)
        
        dateFormatter.dateFormat = "hh:mm a"//date with hour minutes format
        let tmp2 = dateFormatter.stringFromDate(acti.dateActivity!)
        
        self.dateActi.text = tmp1
        self.heureActi.text = tmp2
        let set = acti.actspeak
        speaker = (set?.allObjects)! as! [Speaker] //load all the speakers
        
        self.tableSP.delegate = self
        self.tableSP.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return speaker.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellSP", forIndexPath: indexPath) as! CustomHeaderCell
        
        let set = acti.actspeak
        speaker = (set?.allObjects)! as! [Speaker]
        
        if ((speaker[indexPath.row].nameSpeaker! as String) != ""){
            
            cell.nameSp.text = speaker[indexPath.row].nameSpeaker! as String
        }
        else {
            cell.nameSp.text = "coucou"
        }
        
        return cell //display all the speaker
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        if acti.activityChoosen!.boolValue == true { //display the switch at the state of the boolean activity choosen
            switchState.on = true
        } else {
            switchState.on = false
        }
    }
    
    
    
    @IBAction func unwindToDetailActivity(sender: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetailSpeaker"{ //prepare to segue a speaker
            let nav = segue.destinationViewController as! UINavigationController
            let speakerViewCont = nav.topViewController as! SpeakerViewController
            
            
            if let indexPath=self.tableSP.indexPathForSelectedRow{
                speakerViewCont.speaker = speaker[indexPath.row]
            }
            
        }
        
    }
    
    // print("contenu de speaker avant envoi : " + speaker[0].details!)
    // print("****** segue de activity vers speaker réussi *****")
    
    /*
    // MARK: - Navigation
    
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
