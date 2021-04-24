//
//  ItemController.swift
//   Anchor Point 2
//
//  Created by James Phillips on 4/23/21.
//

import Foundation
class ItemController  {
    
    static let sharedInstance = ItemController()
    var items : [Item] = []
    
    //MARK: - CRUD Functions
    func createItemWith(name: String) {
        let newItem = Item(name:name)
        items.append(newItem)
        ItemController.sharedInstance.saveToPersistenceStore()
    }
    
    func update(item: Item, name: String) {
        item.name = name
        ItemController.sharedInstance.saveToPersistenceStore()
    }
    
    func toggleIsComplete(item: Item)  {
        item.isComplete.toggle()
        ItemController.sharedInstance.saveToPersistenceStore()
    }
    
    func delete(item: Item)  {
        guard let index = items.firstIndex(of: item) else { return }
        items.remove(at: index)
        ItemController.sharedInstance.saveToPersistenceStore()
    }
    
    //MARK: - Persistence Functions
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Item.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: createPersistenceStore())
        }catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore()  {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            items = try JSONDecoder().decode([Item].self, from: data)
        }catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
