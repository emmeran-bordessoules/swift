//
//  ActivityTest.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 16/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import CoreData
import XCTest
@testable import ProjetSwiftFinal

class ActivityTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        //continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        } catch {
            print("Adding in-memory persistent store failed")
        }
        
        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
    
    func testSomethingUsingCoreData() {
        let managedObjectContext = setUpInMemoryManagedObjectContext()
        let entity =  NSEntityDescription.entityForName("Activity",inManagedObjectContext:managedObjectContext)
        
        let activity = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedObjectContext)
        let dateActi = NSDate(timeIntervalSinceReferenceDate: 1467529200)
        activity.setValue(dateActi, forKey: "dateActivity")
        
        let acti = activity as! Activity
        
        XCTAssert(acti.getDateActi(acti) != "04-08")
        XCTAssert(acti.getDateActi(acti) == "04-07")
    }
    
    
    
}
