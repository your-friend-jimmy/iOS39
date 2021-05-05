//
//  Character.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit
class SWCharacterController {
    
    
    enum R { enum Image : String {case ahsoka, anakin,leia,luke,mace,maul,moff,obi,ren,rey,sidious,vader,yoda}}
    
    let characters : [SWCharacter] =
        [SWCharacter(name: .AnakinSkywalker,  faction: .Jedi, photo: UIImage(named: R.Image.anakin.rawValue), question: Question.anakin),
         SWCharacter(name: .ObiWanKenobi,     faction: .Jedi, photo: UIImage(named: R.Image.obi.rawValue),    question: Question.obi),
         SWCharacter(name: .AhsokaTano,       faction: .Jedi, photo: UIImage(named: R.Image.ahsoka.rawValue), question: Question.ahsoka),
         SWCharacter(name: .PrinecssLeia,     faction: .Jedi, photo: UIImage(named: R.Image.leia.rawValue),   question: Question.leia),
         SWCharacter(name: .LukeSkywalker,    faction: .Jedi, photo: UIImage(named: R.Image.luke.rawValue),   question: Question.luke),
         SWCharacter(name: .MaceWindu,        faction: .Jedi, photo: UIImage(named: R.Image.mace.rawValue),   question: Question.mace),
         SWCharacter(name: .MasterYoda,       faction: .Jedi, photo: UIImage(named: R.Image.yoda.rawValue),   question: Question.yoda),
         SWCharacter(name: .DarthMaul,        faction: .Sith, photo: UIImage(named: R.Image.maul.rawValue),   question: Question.maul),
         SWCharacter(name: .MoffGideon,       faction: .Sith, photo: UIImage(named: R.Image.moff.rawValue),   question: Question.moff),
         SWCharacter(name: .DarthVader,       faction: .Sith, photo: UIImage(named: R.Image.vader.rawValue),  question: Question.vader),
         SWCharacter(name: .KyloRen,          faction: .Sith, photo: UIImage(named: R.Image.ren.rawValue),    question: Question.ren),
         SWCharacter(name: .DarthSidious,     faction: .Sith, photo: UIImage(named: R.Image.sidious.rawValue),question: Question.sidious)]
    
    struct SWCharacter : Hashable {
        let name       : Name
        let faction    : Faction
        let photo      : UIImage?
        let question   : Question
        let identifier = UUID()
        
        func hash(into hasher: inout Hasher)  {
            hasher.combine(identifier)
        }
        static func == (lhs: SWCharacter, rhs: SWCharacter)-> Bool {
            return lhs.identifier == rhs.identifier
        }
    }
    enum Faction : String {
        case Jedi
        case Sith
    }
    
    enum Name : String {
        
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
    
    enum Question : String {
        case anakin  = "He gave up the high ground, then he gave up his name."
        case obi     = "Who said \"Skill is the child of patience.\"?"
        case ahsoka  = "This promising student would be betrayed by a friend and kicked out of the Jedi order."
        case leia    = "Who went from prisoner to Space General?."
        case luke    = "Who saved Grogu from Moth Gideon?"
        case mace    = "Who killed Jango Fett?"
        case yoda    = "Fear is the path to the dark side.\n Fear leads to anger.\n Anger leds to hate.\n Hate leads to suffering."
        case maul    = "He defeated Qui-gon but was cut in two by Obi-won."
        case moff    = "Before joining the empire, he was the owner/manager of Los Pollos Hermonos in Albuquerque NM."
        case vader   = "The one who brought balance to the force."
        case ren     = "This Undercover Boss is leader of the First Order and the Knights of Ren."
        case sidious = "His first name is Sheev and he's into politics."
    }
    
}



/*
 [Question(title: "You under estimate my power",
 question: "He gave up the high ground, then he gave up his name.",
 answer: "Anakin Skywalker"),
 
 Question(title: "who said",
 question: "Skill is the child of patience.",
 answer: "Obi Wan Kenobi"),
 
 Question(title: "Friends like this...",
 question: "This promising student would be betrayed by a friend and kicked out of the Jedi order.",
 answer: "Ahsoka Tano"),
 
 Question(title: "Cell 2187",
 question: "Who went from prisoner to Space General.",
 answer: "Prinecss Leia"),
 Question(title: "",
 question: "Who saved Grogu from Moth Gideon",
 answer: "Luke Skywalker"),
 
 Question(title: "You killed My father prepare to die!",
 question: "Who killed Jango Fett?",
 answer: "Mace Windu"),
 
 
 Question(title: "",
 question: "Fear is the path to the dark side.\n Fear leads to anger.\n Anger leds to hate.\n Hate leads to suffering.",
 answer: "Master Yoda"),
 
 
 
 Question(title: "Half off",
 question: "He defeated Qui-gon but was cut in two by Obi-won.",
 answer: "Darth Maul"),
 
 Question(title: "Better call Sal",
 question: "Before joining the empire, he was the owner/manager of Los Pollos Hermonos in Albuquerque NM.",
 answer: "Moff Gideon"),
 
 
 Question(title: "The chosen one.",
 question: "The one who brought balance to the force.",
 answer: "Darth Vader"),
 
 
 Question(title: "Undercover Boss ",
 question: "This Undercover Boss is leader of the First Order and the Knights of Ren.",
 answer: "Kylo Ren"),
 
 Question(title: "Are you threatening me, Master Jedi?",
 question: "His first name is Sheev and he's into politics.",
 answer:  "Darth Sidious")]
 */
