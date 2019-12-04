//
//  Task+Convenience.swift
//  CoreDataBasics
//
//  Created by Christy Hicks on 12/3/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String? = nil, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.notes = notes
    }
}
