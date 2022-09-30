//
//  Practice.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/2/22.
//

import Foundation

struct Practice {
    let practiceTitle: String
    let practiceIMGURL: String?
    let questions: [PracticeQuestion]
    let numQuestionsPerPractice: Int
    let useDefaultOrder: Bool
    
    
    init(title: String, url: String? = nil, questions: [PracticeQuestion], numQuestionsPerPractice: Int = -1, useDefaultOrder: Bool = false) {
        self.practiceTitle = title
        self.practiceIMGURL = url
        self.questions = questions
        self.numQuestionsPerPractice = numQuestionsPerPractice == -1 ? questions.count : numQuestionsPerPractice
        self.useDefaultOrder = useDefaultOrder
    }
}
