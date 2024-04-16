//
//  QuizQuestion.swift
//  Quizzler-iOS13
//
//  Created by SLV on 16.04.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct QuizQuestionStructure {
    let question: String
    let answer: Bool
    
    init(q: String, a: Bool) {
        self.question = q
        self.answer = a
    }
}
