//
//  ServiceFactory.swift
//  Find My Vac
//
//  Created by HARPREET SINGH on 10/26/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class ServiceFactory: NSObject {
    
    //var managedObjectContext : NSManagedObjectContext
    
    override init() {
        super.init()
//        do {
//            try writeDataToPersistentContainer()
//        } catch  {
//            fatalError("Cannot write the data to persistent container with error = \(error)")
//        }
        
    }
    enum CoreDataError:String, Error{
    
        case WriteFailed = "Could not write data to store"
        case ReadFailed = "Could not read value from the store."
        case DataConversionFailed = "Could not convert into Data"
        case JSONParsingFailed = "Could not parse JSON"
        case StoreCreationFailed = "Could not create Persistent store in the App Sandbox"
    
    }
    static let sharedInstance = ServiceFactory()
    var jsonfile:String?

    
    func writeDataToPersistentContainer()  throws {
        
        let jsonArray = try! getJSONArray(forJSONFile: "", forPredicate: "")
        
        // Interating through the Array created
        for singleObject in jsonArray {
            
        guard let jsonDictionary = singleObject as? NSDictionary else {
        throw CoreDataError.WriteFailed
        }
            
        let product = insertNewEntity(name: "Product") as! Product
            
        // Writing the entire Array of Dictionaries to NSManageObject "Product"
            
        product.cellImage = jsonDictionary.value(forKey: "cellImage") as! String?
        product.detailPageProductImage = jsonDictionary.value(forKey: "detailPageProductImage") as! String? 
        product.detailPageProductTitle = jsonDictionary.value(forKey: "detailPageProductTitle") as! String?
        product.priceRange = jsonDictionary.value(forKey: "priceRange") as! String?
        product.menuScreenTitle = jsonDictionary.value(forKey: "menuScreenTitle") as! String?
        product.productFeatureText = jsonDictionary.value(forKey: "productFeatureText") as! String?
        product.seq = jsonDictionary.value(forKey: "seq") as! String?
        product.vacuumType = jsonDictionary.value(forKey: "vacuumType") as! String?
        product.productType = jsonDictionary.value(forKey: "productType") as! String?
        
        }
        saveContext()
    }
    
    func getJSONArray(forJSONFile file:String, forPredicate predString:String) throws -> Array<Any> {

        var jsonArray:Array<Any> = []
        // Create the path to json file
        let path = Bundle.main.path(forResource: file, ofType: "json")
        let productURL = URL(fileURLWithPath: path!) //.init(fileURLWithPath: path!)
        
        // Converting the string file to Data
        guard let jsonData = try? Data(contentsOf: productURL) else {
            fatalError("Error converting String to Data")
        }
        
        // Serializing the data through JSONSerialization class
        jsonArray = try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! Array<Any>

        guard let jsonDictionary = jsonArray as? Array<Dictionary<String, String>> else {
        throw CoreDataError.DataConversionFailed
        }
        var filteredArray:Array<Dictionary<String, String>>!
        for singleObject in jsonDictionary {
         
        // Filtering through JSON Dictionary to based on the Predicate String
        filteredArray = jsonDictionary.filter({$0["priceRange"] == predString})
        print(filteredArray.count)
        }
        
        return filteredArray

}



    func returnSpecificCategoryVacs(forCategory category:String, sortedBy sort:String) throws ->Array<Dictionary<String, String>>{
        
        var productArray : Array<Any> = []
        
        let context = persistentContainer.viewContext
        //var persistentStoreRes = [NSPersistentStoreResult]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Product")
        //let predicateString = category
        let fetchPredicate = NSPredicate(format: "priceRange in[c] %@", category)
        let sortDescriptor = NSSortDescriptor(key: sort, ascending: true)
        let descriptors = [sortDescriptor]
        fetchRequest.predicate = fetchPredicate
        fetchRequest.sortDescriptors = descriptors
    
        //do {
        // productArray = try context.execute(fetchRequest)] as Array<Any>
        
        
        guard let returnedArray = try? context.fetch(fetchRequest) as? [Any] else {
            throw CoreDataError.ReadFailed
        }
            
            //for (index, value) in productArray.enumerated() {
        for singleObject in returnedArray! {
            guard let returnDictionary = singleObject as? NSDictionary else {throw CoreDataError.ReadFailed}
            
            print(returnDictionary)
                //return productArray as! Array<Dictionary<String, String>>
                
            //}
        }
        //} catch  {
          //  print("Error reading from disk =\(error)")
        //}
        return productArray as! Array<Dictionary<String, String>>
    
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

    func insertNewEntity(name:String) -> NSManagedObject {
    let context = persistentContainer.viewContext
    return NSEntityDescription.insertNewObject(forEntityName: name, into: context)
    }
}
