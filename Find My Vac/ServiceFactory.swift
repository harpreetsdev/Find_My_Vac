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

    static let sharedInstance = ServiceFactory()
    
//    func getContext () -> NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//    }
    
    func writeDataToPersistentContainer (audioFileUrlString: String, textFileUrlString: String) {
        let context = self.persistentContainer.viewContext
        
        //retrieve the entity that we just created
        let productEntity =  NSEntityDescription.entity(forEntityName: "Product", in: context)
        
        let product = NSManagedObject(entity: productEntity!, insertInto: context)
        
        //product.
        
//        let transc = NSManagedObject(entity: entity!, insertInto: context)
//        
//        //set the entity values
//        transc.setValue(audioFileUrlString, forKey: "audioFileUrlString")
//        transc.setValue(textFileUrlString, forKey: "textFileUrlString")
//        
//        //save the object
//        do {
//            try context.save()
//            print("saved!")
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        } catch {
//            
//        }
//    }
//    
//    func getTranscriptions () {
//        //create a fetch request, telling it about the entity
//        let fetchRequest: NSFetchRequest<Transcription> = Transcription.fetchRequest()
//        
//        do {
//            //go get the results
//            let searchResults = try getContext().fetch(fetchRequest)
//            
//            //I like to check the size of the returned results!
//            print ("num of results = \(searchResults.count)")
//            
//            //You need to convert to NSManagedObject to use 'for' loops
//            for trans in searchResults as [NSManagedObject] {
//                //get the Key Value pairs (although there may be a better way to do that...
//                print("\(trans.value(forKey: "audioFileUrlString"))")
//            }
//        } catch {
//            print("Error with request: \(error)")
//        }
    }
    
    
    func writeDataToPersistentStore() throws {}
//    guard let jsonObject = try
//    { return <#return value#> }
//    }
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
