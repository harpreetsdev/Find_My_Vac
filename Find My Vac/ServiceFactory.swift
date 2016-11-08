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
    
    //var managedObjectContext : NSManagedObjectContext
    
    override init() {
//        guard let modelURL = Bundle.main.url(forResource: "Find_My_Vac", withExtension: "momd") else {
//            fatalError("Error loading the bundle")
//        }
//        guard let managedModel = NSManagedObjectModel.init(contentsOf: modelURL) else {
//            fatalError("Error initializing the Model")
//        }
//        
//        let persistentStoreCoord = NSPersistentStoreCoordinator(managedObjectModel: managedModel)
//        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        managedObjectContext.persistentStoreCoordinator = persistentStoreCoord
//        
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let docURL = urls[urls.endIndex-1]
//        
//        let storeURL = docURL.appendingPathComponent("Find_My_Vac.sqlite")
//        
//        do {
//            try persistentStoreCoord.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
//        } catch  {
//            fatalError("Could not initialzie the Persistent store coordinator")
//        }
        
        
    }
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
       //let psc = persistentContainer.persistentStoreCoordinator
       let storeURL = persistentContainer.persistentStoreDescriptions.first?.url //applicationDocumentsDirectory.appendingPathComponent("Find_My_Vac.sqlite")
       
//        do {
//            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
//        } catch  {
//            fatalError("Could not initialzie the Persistent store coordinator")
//        }
        
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: (storeURL?.absoluteString)!) {
        //try! fileManager.createDirectory(at: (storeURL)!, withIntermediateDirectories: true, attributes: nil)
        }
        else {
        print("No file exists at path.")
        }
        //       let coordinator = self.persistentContainer.persistentStoreCoordinator
       // Create the path to json file
       let path = Bundle.main.path(forResource: "ProductData", ofType: "json")
       let productURL = URL.init(fileURLWithPath: path!)
        
        // Converting the string file to Data
        
        guard let jsonData = try? Data.init(contentsOf: productURL) else {
        fatalError("Error converting String to Data")
        }
        // Serializing the data through JSONSerialization class
        
        jsonArray = try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<Any>
        // Interating through the Array created
        for (index, value) in jsonArray.enumerated() {
            
        let productEntity = NSEntityDescription.entity(forEntityName:"Product", in: persistentContainer.viewContext)
        let product = Product(entity: productEntity!, insertInto: context)

            
        // Writing the entire Array of Dictionaries to NSManageObject
        
        print(index)
        product.cellImage = (value as! Dictionary)["cellImage"]
        product.detailPageProductImage = (value as! Dictionary)["detailPageProductImage"]
        product.detailPageProductTitle = (value as! Dictionary)["detailPageProductTitle"]
        product.priceRange = (value as! Dictionary)["priceRange"]
        product.menuScreenTitle = (value as! Dictionary)["menuScreenTitle"]
        product.productFeatureText = (value as! Dictionary)["productFeatureText"]
        product.seq = (value as! Dictionary)["seq"]
        product.vacuumType = (value as! Dictionary)["vacuumType"]
        product.productType = (value as! Dictionary)["productType"]
        
        saveContext()
        }
        
    }
    
    func returnSpecificCategoryVacs(forCategory category:String, sortedBy sort:String) throws ->Array<Any>{
        //var productArray = [Product]()
        let context = persistentContainer.viewContext
        //var persistentStoreRes = [NSPersistentStoreResult]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        //let predicateString = category
        //let fetchPredicate = NSPredicate(format: "priceRange = \(category)", argumentArray: nil)
        let sortDescriptor = NSSortDescriptor.init(key: sort, ascending: true)
        let descriptors = [sortDescriptor]
        //fetchRequest.predicate = fetchPredicate
        fetchRequest.sortDescriptors = descriptors
    
        do {
            let productArray = [try context.execute(fetchRequest)] as Array<Any>
            
            
            for (index, value) in productArray.enumerated() {

            print("Item index = \(index)")
            print("Item value = \(value)")
            return productArray
            }
        } catch  {
            print("Error reading from disk =\(error)")
        }
        return []
    
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
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        return documentsDirectory
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
