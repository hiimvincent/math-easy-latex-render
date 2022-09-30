//
//  PracticeTracker.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/2/22.
//

import Foundation

class PracticeTracker: ObservableObject {
    let questions: [PracticeQuestion]
    let numQuestionsPerPractice: Int
    let useDefaultOrder: Bool
    
    @Published var currentQuestion: PracticeQuestion
    @Published var selection: [Int: [Bool]]
    @Published var answers: [String]
    @Published var shuffleIndices: [Int]
    
    var currentQuestionIndex: Int
    @Published var hasStarted: Bool
    @Published var hasFinished: Bool
    @Published var showFinishView: Bool
    @Published var isCorrect: Bool
    
    @Published var animationSwitch: Bool
    var hasSubmitted: Bool
    var numCorrect: Int
    @Published var questionsCompleted: Int
    
    init(questions: [PracticeQuestion], numQuestionPerPractice: Int, useDefaultOrder: Bool) {
        self.useDefaultOrder = useDefaultOrder
        self.numQuestionsPerPractice = numQuestionPerPractice
        self.animationSwitch = true
        self.numCorrect = 0
        self.questionsCompleted = 0
        self.hasSubmitted = false
        self.hasStarted = false
        self.hasFinished = false
        self.isCorrect = false
        self.showFinishView = false
        self.currentQuestionIndex = 0
        
        var modifiedQuestions = questions
        if !useDefaultOrder {
            modifiedQuestions.shuffle()
        }
        self.questions = Array(modifiedQuestions[0..<numQuestionPerPractice])
        self.currentQuestion = self.questions[0]
        self.answers = self.questions[0].answerLatexStrings
        var tempShuffleIndices: [Int]
        if let order = self.questions[0].specificOrder {
            //self.shuffleIndices = order
            tempShuffleIndices = order
        } else {
//            self.shuffleIndices = Array(0..<self.questions[0].answerLatexStrings.count)
//            self.shuffleIndices.shuffle()
            tempShuffleIndices =  Array(0..<self.questions[0].answerLatexStrings.count)
            tempShuffleIndices.shuffle()
        }
        shuffleIndices = tempShuffleIndices
        selection = [:]
        for index in 0..<self.answers.count {
            selection[index] = [shuffleIndices[index] <= self.questions[0].correctAnswerLastIndex, false]
        }
    }
    
    func nextQuestion() {
        //animationSwitch.toggle()
        hasSubmitted = false
        //questionsCompleted += 1
        currentQuestionIndex += 1
        currentQuestion = questions[currentQuestionIndex]
        isCorrect = false
        self.answers = self.currentQuestion.answerLatexStrings
        if let order = self.currentQuestion.specificOrder {
            self.shuffleIndices = order
        } else {
            self.shuffleIndices = Array(0..<self.answers.count)
            self.shuffleIndices.shuffle()
        }
        selection = [:]
        for index in 0..<self.answers.count {
            selection[index] = [shuffleIndices[index] <= currentQuestion.correctAnswerLastIndex, false]
        }
    }
    
    func clearSelection() {
        //for index in 0..<self.answers.count {
        for index in 0..<selection.values.count {
            selection[index]![1] = false
        }
    }
    
    func submit() {
        var isCorrectTemp = true
        for val in selection.values {
            if (val[0] && !val[1]) || (!val[0] && val[1]) {
                isCorrectTemp = false
            }
        }
        isCorrect = isCorrectTemp
        questionsCompleted += isCorrect ? 1 : 0
        if !hasSubmitted {
            numCorrect += isCorrect ? 1 : 0
            hasSubmitted = true
        }
        if isCorrect && currentQuestionIndex >= questions.count - 1 {
            hasFinished = true
        }
    }

    
}

