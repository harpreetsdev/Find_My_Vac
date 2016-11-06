//
//  ServiceFactory.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/26/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit
import CoreData

class ServiceFactory: NSObject {
    
    enum CoreDataError:Error {
    
        case WriteFailed
        case ReadFailed
        case DataConversionFailed
    
    }
    static let sharedInstance = ServiceFactory()
    var jsonfile:String?

    
    func writeDataToPersistentContainer()  throws {
       var jsonArray:Array<Any>
       let context = persistentContainer.viewContext
//       let coordinator = self.persistentContainer.persistentStoreCoordinator
       // Create the path to json file
       let path = Bundle.main.path(forResource: "ProductData", ofType: "json")
       let productURL = URL.init(fileURLWithPath: path!)
        
        // Converting the string file to Data
        let jsonData = try? Data.init(contentsOf: productURL)
        // Serializing the data through JSONSerialization class
        jsonArray = try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<Any>
        // Interating through the Array created
        for singleObject in jsonArray {
            
        let productEntity = NSEntityDescription.entity(forEntityName: "Product", in: context)
        let product = Product(entity: productEntity!, insertInto: context)
        
        // Writing the entire Array of Dictionary to NSManageObject
        product.cellImage = (singleObject as! Dictionary)["cellImage"]
        product.detailPageProductImage = (singleObject as! Dictionary)["detailPageProductImage"]
        product.detailPageProductTitle = (singleObject as! Dictionary)["detailPageProductTitle"]
        product.priceRange = (singleObject as! Dictionary)["priceRange"]
        product.menuScreenTitle = (singleObject as! Dictionary)["menuScreenTitle"]
        product.productFeatureText = (singleObject as! Dictionary)["productFeatureText"]
        product.seq = (singleObject as! Dictionary)["seq"]
        product.vacuumType = (singleObject as! Dictionary)["vacuumType"]
        product.productType = (singleObject as! Dictionary)["productType"]
        
        saveContext()
        }
        
    }
    
    func returnSpecificCategoryVacs()->Array<Any>{
        var returnedObjects:Array<Any> = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Product")
        fetchRequest.predicate = NSPredicate.init(format: "priceRange == MediumRange", argumentArray: [])
        
        //returnedObjects = try! persistentContainer.viewContext.execute(fetchRequest) as! Array<Any>
        
    }
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Find_My_Vac")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as NSURL
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
