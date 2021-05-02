//
//  Character.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit


struct Character  {
    
    enum Faction : String {
        case Jedi
        case Sith
    }
     
    enum CharacterName : String {
        case AnakinSkywalker = "Anakin Skywalker"
        case ObiWanKenobi    = "Obi Wan Kenobi"
        case AhsokaTano      = "Ahsoka Tano"
        case PrinecssLeia    = "Prinecss Leia"
        case LukeSkywalker   = "Luke Skywalker"
        case MaceWindu       = "Mace Windu"
        case MasterYoda      = "Master Yoda"
        case DarthMaul       = "Darth Maul"
        case MoffGideon      = "Moff Gideon"
        case DarthVader      = "Darth Vader"
        case KyloRen         = "Kylo Ren"
        case DarthSidious    = "Darth Sidious"
    }
    
    
    
    let name       : CharacterName
    let faction    : Faction
    let photo      : UIImage?
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
