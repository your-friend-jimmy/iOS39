//
//  EntryController.swift
//  JournalCoreData
//
//  Created by James Phillips on 4/26/21.
//

import CoreData

class EntryController {
    static let sharedController = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    func createEntry(title: String, body: String)  {
        let entry = Entry(title: title, bodyText:body, timeStamp: Date())
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries()  {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry )  {
        CoreDataStack.saveContext()
        
        func deleteEntry()  {
            //TODO
        }
    }
}

