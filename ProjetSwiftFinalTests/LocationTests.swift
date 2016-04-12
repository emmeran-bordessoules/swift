//
//  LocationTests.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 12/04/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import CoreData
import XCTest
import MapKit
@testable import ProjetSwiftFinal

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
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
        let entity =  NSEntityDescription.entityForName("Location",inManagedObjectContext:managedObjectContext)
        
        let location = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedObjectContext)
        location.setValue("43.6398915,3.8464246",forKey: "adressLocation")
        
        let loca = location as! Location
        
        XCTAssert(loca.coordinate.latitude == 43.6398915 && loca.coordinate.longitude == 3.8464246)
    }
}
