//
//  Character.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit
class Character {
    let name: String
    let photo : UIImage?
    let faction : String
    var uuid : String
    
    init(name: String, photo: UIImage, faction: String, uuid: String = UUID().uuidString) {
        self.name = name
        self.photo = photo
        self.faction = faction
        self.uuid = uuid
    }
}
extension Character : Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
