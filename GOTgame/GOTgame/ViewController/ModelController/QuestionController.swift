//
//  QuestionController.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import Foundation


class QuestionController {
   static let sharedInstance = QuestionController()
    
    let questions = [Question(title: "You killed My father prepare to die!", question: "Who killed Jango Fett?", answer:.MaceWindu)]
}
enum  AnswerId {
    case  AnakinSkywalker,
          ObiWanKenobi,
          AhsokaTano,
          Leia,
          MaceWindu,
          Rey,
          Yoda,
          DarthMaul,
          MoffGideon,
          DarthVader,
          KyloRen,
          DarthSidious
}
