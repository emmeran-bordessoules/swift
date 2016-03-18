//
//  TableViewController.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 11/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit
import CoreData


class TableViewController: UITableViewController {
    
    
    var activities : [Activity] = []
    
    var headerAct = ["Day 1 : Monday, July 4","Day 2 : Tuesday, July 5","Day 3 : Wednesday, July 6",
        "Day 4 : Thursday, July 7","Day 5 : Friday, July 8","Day 6 : Saturday, July 9"]
    
    var day1 : [Activity] = []
    var day2 : [Activity] = []
    var dayErr : [Activity] = []
    
    var sections = Dictionary<String, Array<Activity>>()
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return self.sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        return self.sections[headerAct[section]]!.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        
        let tableSection = sections[headerAct[indexPath.section]]
        let tableItem = tableSection![indexPath.row]
        
        cell!.textLabel?.text = tableItem.nameActivity
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        let dateActivityForma = dateFormatter.stringFromDate(tableItem.dateActivity!)
        cell?.detailTextLabel?.text = dateActivityForma
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.grayColor()
        
        headerCell.headerLabel.text = headerAct[section]
        
        return headerCell
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        //footerView.backgroundColor = UIColor.blackColor()
        
        return footerView
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(64,0,0,0);
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Activity")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            activities = results as! [Activity]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        activities.sortInPlace({ $0.dateActivity!.compare($1.dateActivity!) == .OrderedAscending })
        self.tableView.reloadData()
        
        self.sections[headerAct[0]] = day1
        self.sections[headerAct[1]] = day2
        
        for i in activities{
            
            switch (i.getDateActi(i)) {
            case "01-01":
                self.sections[headerAct[0]]!.append(i)
            case "10-01":
                self.sections[headerAct[1]]!.append(i)
            default:
                self.dayErr.append(i)
                
            }
        }
        
    }
    
    
    @IBAction func unwindToActivity(sender: UIStoryboardSegue){
        
        // yolo
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "ShowDetail"{
            let nav = segue.destinationViewController as! UINavigationController
            let actiViewCont = nav.topViewController as! ActivityDetailViewController
            
            
            if let indexPath=self.tableView.indexPathForSelectedRow{
                let tableSection = sections[headerAct[indexPath.section]]
                let tableItem = tableSection![indexPath.row]
                actiViewCont.acti = tableItem
            }
        }
        
        
    }
    
    
    
    // MARK: - Table view data source
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}