//
//  Question.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import Foundation

struct Question {
    let title : String
    let question : String
    let answer : String
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher)  {
        hasher.combine(identifier)
    }
}
extension Question : Hashable {
    static func == (lhs: Question, rhs: Question)-> Bool {
        return lhs.identifier == rhs.identifier
    }
}
