//
//  LatexRenderApp.swift
//  LatexRender
//
//  Created by Vincent Johnson on 12/30/21.
//

import SwiftUI

@main
struct LatexRenderApp: App {
    var body: some Scene {
        WindowGroup {
            // Sample Questions for Commutative Property Beginner Lesson
            let p1 = PracticeQuestion(text: "Which of these are commutative?", answers: ["Multiplication", "Addition", "Division", "Subtraction"], answerLastIndex: 1)

            let p2 = PracticeQuestion(text: "Which equation is incorrect?", answers: ["$8 - 4 = 4 - 8$", "$12 + 5 = 5 + 12$", "$16 \\times 3 = 3 \\times 16$", "$10 \\times 6 = 6 \\times 10$"])

            let p3 = PracticeQuestion(text: "Which of these are not commutative?", answers: ["Division", "Subtraction", "Multiplication", "Addition"], answerLastIndex: 1)

            let p4 = PracticeQuestion(text: "Is division commutative?", answers: ["No", "Yes"])

            let p5 = PracticeQuestion(text: "Which equation is incorrect?", answers: ["$10 \\div 2 = 2 \\div 10$", "$4 \\times 3 = 3 \\times 4$", "$10 + 2 = 2 + 10$", "$4 + 3 = 3 + 4$"])

            let p6 = PracticeQuestion(text: "Is multiplication commutative?", answers: ["Yes", "No"])

            let p7 = PracticeQuestion(text: "Is addition commutative?", answers: ["Yes", "No"])

            let p8 = PracticeQuestion(text: "Which equation is incorrect?", answers: ["Trick Question!", "$5 \\times 5 = 5 \\times 5$", "$5 + 5 = 5 + 5$", "$5 \\div 5 = 5 \\div 5$", "$5 - 5 = 5 - 5$"], specificOrder: [1, 2, 3, 4, 0 ])

            let p = Practice(title: "Commutative Property", questions: [p1, p2, p3, p4, p5, p6, p7, p8], useDefaultOrder: true)
            PracticeOverallView(practice: p)
            //LessonTabView()
        }
    }
}
