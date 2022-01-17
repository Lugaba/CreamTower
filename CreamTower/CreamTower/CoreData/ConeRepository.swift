//
//  ConeRepository.swift
//  CreamTower
//
//  Created by Luca Hummel on 17/01/22.
//

import Foundation
import CoreData

class ConeRepository {
    static let shared: ConeRepository = ConeRepository()
    
    private init() {}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Model")
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
    
    // MARK: - Core Data Getting support
    
    func getAllCones() -> [Cone] {
        let fr = NSFetchRequest<Cone>(entityName: "Cone")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        } catch {
            print(error)
        }
        return []
    }
    
    // MARK: - Core Data Creating support
    
    func createCone(name: String, price: Int32, imageName: String, isBought: Bool, isSelected: Bool) -> Cone {
        let cone = Cone(context: self.persistentContainer.viewContext)
        
        cone.name = name
        cone.price = price
        cone.imageName = imageName
        cone.isBought = isBought
        cone.isSelected = isSelected
        
        self.saveContext()
        return cone
    }
    
    // MARK: - Core Data deleting support
    
    func deleteCone(cone: Cone) {
        self.persistentContainer.viewContext.delete(cone)
        self.saveContext()
    }
}