//
//  AppDelegate.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 11/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func deleteAllData(entity: String)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.deleteObject(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    
    // Insertion of datas
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        deleteAllData("Activity")
//        print("coreData erased")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //connection to the database
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Activity") //request all the activities
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)//execute the request
            if results.count == 0{ //see if the database is empty. If so fill it
                print("chargement des données")
                let entity2 =  NSEntityDescription.entityForName("Location",inManagedObjectContext:managedContext)
                let location = NSManagedObject(entity: entity2!,insertIntoManagedObjectContext: managedContext)
                let location2 = NSManagedObject(entity: entity2!,insertIntoManagedObjectContext: managedContext)
                let location3 = NSManagedObject(entity: entity2!,insertIntoManagedObjectContext: managedContext)
                let location4 = NSManagedObject(entity: entity2!,insertIntoManagedObjectContext: managedContext)
                
                location.setValue("43.6398915,3.8464246",forKey: "adressLocation")
                location.setValue("Veyrassi sport center",forKey: "nameLocation")
                
                location2.setValue("43.6294134,3.8582231",forKey: "adressLocation")
                location2.setValue("Triolet",forKey: "nameLocation")
                
                location3.setValue("43.6140808,3.877148",forKey: "adressLocation")
                location3.setValue("Law Faculty",forKey: "nameLocation")
                
                location4.setValue("43.6176307,3.8700197",forKey: "adressLocation")
                location4.setValue("Saint Charles",forKey: "nameLocation")
                
                let entity =  NSEntityDescription.entityForName("Activity",inManagedObjectContext:managedContext)
                let activity = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity2 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity3 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity4 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity5 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity6 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity7 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity8 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity9 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity10 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity11 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity12 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                let activity13 = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
                
                
                activity.setValue("Opening ceremony", forKey: "nameActivity")
                var dateActi = NSDate(timeIntervalSinceReferenceDate: 1467529200)
                activity.setValue(dateActi, forKey: "dateActivity")
                activity.setValue("When the fun start, the program of the week", forKey: "descriptionActivity")
                activity.setValue(true,forKey:"activityChoosen")
                activity.setValue(location3,forKey:"actloc")
                
                activity2.setValue("Lunch", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467540000)
                activity2.setValue(dateActi, forKey: "dateActivity")
                activity2.setValue("Lunch in a beautiful restaurant called MacDo, taste the french gastronomy", forKey: "descriptionActivity")
                activity2.setValue(false,forKey:"activityChoosen")
                activity2.setValue(location4,forKey:"actloc")
                
                activity3.setValue("UNESCO session", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467546300)
                activity3.setValue(dateActi, forKey: "dateActivity")
                activity3.setValue("UNESCO will present their goal and organisation ", forKey: "descriptionActivity")
                activity3.setValue(false,forKey:"activityChoosen")
                activity3.setValue(location3,forKey:"actloc")
                
                activity4.setValue("Plenary session : Values/Ethics", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467615600)
                activity4.setValue(dateActi, forKey: "dateActivity")
                activity4.setValue("A session to talk about Values, Ethics and Integrity ", forKey: "descriptionActivity")
                activity4.setValue(false,forKey:"activityChoosen")
                activity4.setValue(location3,forKey:"actloc")
                
                activity5.setValue("Workshops: Values/Ethics", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467619200)
                activity5.setValue(dateActi, forKey: "dateActivity")
                activity5.setValue("A great Workshops to talk about Values, Ethics and Integrity ", forKey: "descriptionActivity")
                activity5.setValue(false,forKey:"activityChoosen")
                activity5.setValue(location4,forKey:"actloc")
                
                activity6.setValue("Plenary session: Leadership", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467702000)
                activity6.setValue(dateActi, forKey: "dateActivity")
                activity6.setValue("How to become a leader in 10 lessons ", forKey: "descriptionActivity")
                activity6.setValue(false,forKey:"activityChoosen")
                activity6.setValue(location3,forKey:"actloc")
                
                activity7.setValue("Workshop: Leadership", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467705600)
                activity7.setValue(dateActi, forKey: "dateActivity")
                activity7.setValue("think leader, eat leader, be leader, sleep leader", forKey: "descriptionActivity")
                activity7.setValue(false,forKey:"activityChoosen")
                activity7.setValue(location4,forKey:"actloc")
                
                activity8.setValue("Plenary session: Dual Career", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467788400)
                activity8.setValue(dateActi, forKey: "dateActivity")
                activity8.setValue("A single career is good, but a double is better", forKey: "descriptionActivity")
                activity8.setValue(false,forKey:"activityChoosen")
                activity8.setValue(location3,forKey:"actloc")
                
                activity9.setValue("Sport presentation: Handball", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467792000)
                activity9.setValue(dateActi, forKey: "dateActivity")
                activity9.setValue("Learn to play the greatest sport in earth after basketball ", forKey: "descriptionActivity")
                activity9.setValue(false,forKey:"activityChoosen")
                activity9.setValue(location3,forKey:"actloc")
                
                activity10.setValue("Plenary session: Gender equality", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467874800)
                activity10.setValue(dateActi, forKey: "dateActivity")
                activity10.setValue("Gender equality and equal opportunities or access", forKey: "descriptionActivity")
                activity10.setValue(false,forKey:"activityChoosen")
                activity10.setValue(location3,forKey:"actloc")
                
                activity11.setValue("Workshop: Gender equality", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467882900)
                activity11.setValue(dateActi, forKey: "dateActivity")
                activity11.setValue("Time to practise Gender equality...", forKey: "descriptionActivity")
                activity11.setValue(false,forKey:"activityChoosen")
                activity11.setValue(location4,forKey:"actloc")
                
                activity12.setValue("Project Presentation", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467961200)
                activity12.setValue(dateActi, forKey: "dateActivity")
                activity12.setValue("Oral Presentation, don't stress ", forKey: "descriptionActivity")
                activity12.setValue(false,forKey:"activityChoosen")
                activity12.setValue(location3,forKey:"actloc")
                
                activity13.setValue("Forum conclusions", forKey: "nameActivity")
                dateActi = NSDate(timeIntervalSinceReferenceDate: 1467961200)
                activity13.setValue(dateActi, forKey: "dateActivity")
                activity13.setValue("It's OVER, I repeat : IT'S OVER ", forKey: "descriptionActivity")
                activity13.setValue(false,forKey:"activityChoosen")
                activity13.setValue(location3,forKey:"actloc")
                
                
            
                
                let entity3 =  NSEntityDescription.entityForName("Speaker",inManagedObjectContext:managedContext)
                let speaker = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                let speaker2 = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                let speaker3 = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                let speaker4 = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                let speaker5 = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                let speaker6 = NSManagedObject(entity: entity3!,insertIntoManagedObjectContext: managedContext)
                
                speaker.setValue("Speaker 1", forKey: "nameSpeaker")
                speaker.setValue("Description speaker 1", forKey: "details")
                
                speaker2.setValue("Speaker 2", forKey: "nameSpeaker")
                speaker2.setValue("Description speaker 2", forKey: "details")
                
                speaker3.setValue("Speaker 3", forKey: "nameSpeaker")
                speaker3.setValue("Description speaker 3", forKey: "details")
                
                speaker4.setValue("Speaker 4", forKey: "nameSpeaker")
                speaker4.setValue("Description speaker 4", forKey: "details")
                
                speaker5.setValue("Speaker 5", forKey: "nameSpeaker")
                speaker5.setValue("Description speaker 5", forKey: "details")
                
                speaker6.setValue("Speaker 6", forKey: "nameSpeaker")
                speaker6.setValue("Description speaker 6", forKey: "details")
                
                activity.setValue(NSSet(object: speaker), forKey: "actspeak")
                var activityspeaker = activity.mutableSetValueForKey("actspeak")
                activityspeaker.addObject(speaker2)
                activityspeaker.addObject(speaker3)
                activityspeaker.addObject(speaker4)
                activityspeaker.addObject(speaker5)
                activityspeaker.addObject(speaker6)
                
                activity3.setValue(NSSet(object: speaker3), forKey: "actspeak")
                
                activity4.setValue(NSSet(object: speaker4), forKey: "actspeak")
                activityspeaker = activity4.mutableSetValueForKey("actspeak")
                activityspeaker.addObject(speaker2)
                
                
                do {
                    try managedContext.save()
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.LaCoherence.ProjetSwiftFinal" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("ProjetSwiftFinal", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

