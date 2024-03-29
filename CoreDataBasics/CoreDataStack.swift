//
//  CoreDataStack.swift
//  CoreDataBasics
//
//  Created by Christy Hicks on 12/3/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
       let newContainer = NSPersistentContainer(name: "Tasks")
        newContainer.loadPersistentStores { (_, error) in
            guard error == nil else {
                fatalError("Failed to load persistent stores: \(error!)")
            }
        }
        return newContainer
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
