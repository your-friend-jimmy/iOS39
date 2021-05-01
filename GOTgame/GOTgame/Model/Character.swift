//
//  Character.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit
enum Faction{
    case Jedi,Sith
}
struct Character  {
    let name : String
    let photo : UIImage?
    let faction : Faction
    let identifier = UUID()
   
 
    func hash(into hasher: inout Hasher)  {
        hasher.combine(identifier)
    }
}
extension Character  : Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
