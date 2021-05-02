//
//  CharacterController.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit
class  CharacterController   {
    static let sharedInstance = CharacterController()
    
    let jedi = [Character(name: .AnakinSkywalker, faction: .Jedi, photo: UIImage(named: "anakin")),
                Character(name: .ObiWanKenobi,    faction: .Jedi, photo: UIImage(named: "obi")),
                Character(name: .AhsokaTano,      faction: .Jedi, photo: UIImage(named: "ahsoka")),
                Character(name: .PrinecssLeia,    faction: .Jedi, photo: UIImage(named: "leia")),
                Character(name: .LukeSkywalker,   faction: .Jedi, photo: UIImage(named: "luke")),
                Character(name: .MaceWindu,       faction: .Jedi, photo: UIImage(named: "mace")),
                Character(name: .MasterYoda,      faction: .Jedi, photo: UIImage(named: "yoda"))]
    
    let sith = [Character(name: .DarthMaul,       faction: .Sith, photo: UIImage(named: "maul")),
                Character(name: .MoffGideon,      faction: .Sith, photo: UIImage(named: "moff")),
                Character(name: .DarthVader,      faction: .Sith, photo: UIImage(named: "vader")),
                Character(name: .KyloRen,         faction: .Sith, photo: UIImage(named: "ren")),
                Character(name: .DarthSidious,    faction: .Sith, photo: UIImage(named: "sidious"))]
}
