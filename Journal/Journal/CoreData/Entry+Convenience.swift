//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by James Phillips on 4/26/21.
//

import CoreData
extension Entry {
    @discardableResult convenience init(title: String, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timeStamp
    }
}
