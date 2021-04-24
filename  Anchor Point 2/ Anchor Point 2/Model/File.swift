//
//  File.swift
//   Anchor Point 2
//
//  Created by James Phillips on 4/23/21.
//

import Foundation

class Item: Codable {
    
    var name : String
    let uuid : String
    var isComplete : Bool
    
    init(name: String, uuid: String = UUID().uuidString, isComplete: Bool = false) {
        self.name = name
        self.uuid = uuid
        self.isComplete = isComplete
    }
}
extension Item : Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
