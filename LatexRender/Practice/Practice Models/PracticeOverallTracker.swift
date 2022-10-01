//
//  PracticeOverallTracker.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/13/22.
//

import Foundation

class PracticeOverallTracker: ObservableObject {
    let practice: Practice
    
    @Published var questionCountEven: Int = 0
    @Published var questionCountOdd: Int = -1
    @Published var useEven: Bool = true
    @Published var hasFinished: Bool = false
    @Published var showFinishView: Bool = false
    @Published var questionsCompleted: Int = 0
    @Published var numCorrect: Int = 0
    @Published var selectionEven: [Int: [Bool]] = [:]
    @Published var selectionOdd: [Int: [Bool]] = [:]
    @Published var shuffledIndicesEven: [Int] = []
    @Published var shuffledIndicesOdd: [Int] = []
    @Published var isCorrectEven: Bool = false
    @Published var isCorrectOdd: Bool = false
    @Published var hasSubmittedEven: Bool = false
    @Published var hasSubmittedOdd: Bool = false
    
    
    let shuffledQuestions: [PracticeQuestion]
    
    
    init (practice: Practice) {
        self.practice = practice
        
        //limit if specified # of questions and shuffle if no default order
        var modifiedQuestions = practice.questions
        if !practice.useDefaultOrder {
            modifiedQuestions.shuffle()
        }
        shuffledQuestions = Array(modifiedQuestions[0..<practice.numQuestionsPerPractice])
        
        //initialize selection and shuffledIndices for even and odd
        if practice.numQuestionsPerPractice > 0 {
            shuffle(question: practice.questions[0], isEven: true)
        } else {
            hasFinished = true
        }
    }
        
    
    func shuffle(question: PracticeQuestion, isEven: Bool) {
        var tempShuffledIndices: [Int]
        if let order = question.specificOrder {
            tempShuffledIndices = order
        } else {
            tempShuffledIndices =  Array(0..<question.answerLatexStrings.count)
            tempShuffledIndices.shuffle()
        }
        var tempSelection: [Int: [Bool]] = [:]
        for index in 0..<question.answerLatexStrings.count {
            tempSelection[index] = [tempShuffledIndices[index] <= question.correctAnswerLastIndex, false]
        }
        if isEven {
            shuffledIndicesEven = tempShuffledIndices
            selectionEven = tempSelection
        } else {
            shuffledIndicesOdd = tempShuffledIndices
            selectionOdd = tempSelection
        }
        
    }
    
    
    func increment() {
        //if last question set hasFinished to true, else increment relevant counter
        if max(questionCountOdd, questionCountEven) >= shuffledQuestions.count - 1 {
            hasFinished = true
        } else {
            if useEven {
                questionCountOdd += 2
            } else {
                questionCountEven += 2
            }
            useEven.toggle()
        }
    }
    
    
    func clearSelection(isEven: Bool) {
        if isEven {
            for index in 0..<selectionEven.values.count {
                selectionEven[index]![1] = false
            }
        } else {
            for index in 0..<selectionOdd.values.count {
                selectionOdd[index]![1] = false
            }
        }
    }
    
    
    func evenQuestion() -> PracticeQuestion {
        return shuffledQuestions[questionCountEven]
    }
    
    
    func oddQuestion() -> PracticeQuestion {
        return shuffledQuestions[questionCountOdd]
    }
    
    
    func submit(isEven: Bool) {
        var isCorrectTemp = true
        for val in isEven ? selectionEven.values : selectionOdd.values {
            if (val[0] && !val[1]) || (!val[0] && val[1]) {
                isCorrectTemp = false
            }
        }
        
        if isEven {
            isCorrectEven = isCorrectTemp
        } else {
            isCorrectOdd = isCorrectTemp
        }
        questionsCompleted += isCorrectTemp ? 1 : 0
        
        if !hasSubmittedEven && isEven  {
            numCorrect += isCorrectTemp ? 1 : 0
            hasSubmittedEven = true
        } else if !hasSubmittedOdd && !isEven {
            numCorrect += isCorrectTemp ? 1 : 0
            hasSubmittedOdd = true
        }
        
        if isCorrectTemp && max(questionCountEven, questionCountOdd) >= shuffledQuestions.count - 1 {
            hasFinished = true
        }
    }
    
    func nextQuestion() {
        if useEven {
            isCorrectOdd = false
            hasSubmittedOdd = false
            
        } else {
            isCorrectEven = false
            hasSubmittedEven = false
        }
        
        increment()
        shuffle(question: shuffledQuestions[useEven ? questionCountEven : questionCountOdd], isEven: useEven)
    }
}
