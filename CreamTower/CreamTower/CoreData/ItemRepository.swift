//
//  ItemRepository.swift
//  CreamTower
//
//  Created by Luca Hummel on 13/01/22.
//

import Foundation
import CoreData

class ItemRepository {
    static let shared: ItemRepository = ItemRepository()
    
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
    
    func getAllItems() -> [Item] {
        let fr = NSFetchRequest<Item>(entityName: "Item")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        } catch {
            print(error)
        }
        return []
    }
    
    // MARK: - Core Data Creating support
    
    func createItem(name: String, price: Int32, imageName: String, isBought: Bool, isSelected: Bool, type: String) -> Item {
        let item = Item(context: self.persistentContainer.viewContext)
        
        item.name = name
        item.price = price
        item.imageName = imageName
        item.isBought = isBought
        item.isSelected = isSelected
        item.type = type
        
        self.saveContext()
        return item
    }
    
    // MARK: - Core Data deleting support
    
    func deleteItem(item: Item) {
        self.persistentContainer.viewContext.delete(item)
        self.saveContext()
    }
}
