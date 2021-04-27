//
//  File.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import Foundation
class Question {
    
    let name : String?
    let question : String
    let answer : Int
    
    init(name: String?, question: String, answer: Int) {
        self.name = name
        self.question = question
        self.answer = answer
    }
    
}
