//
//  PracticeQuestion.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/2/22.
//

import Foundation

struct PracticeQuestion {
    let questionText: String
    let questionIMGURL: String?
    let questionEquation: String?
    let answerLatexStrings: [String]
    let multipleAnswers: Bool
    let correctAnswerLastIndex: Int
    let specificOrder: [Int]?
    
    init(text: String, url: String? = nil, equation: String? = nil, answers: [String], multipleAnswers: Bool = false, answerLastIndex: Int = 0, specificOrder: [Int]? = nil) {
        self.questionText = text
        self.questionIMGURL = url
        self.questionEquation = equation
        self.answerLatexStrings = answers
        self.multipleAnswers = multipleAnswers
        self.correctAnswerLastIndex = answerLastIndex
        self.specificOrder = specificOrder
    }
}
