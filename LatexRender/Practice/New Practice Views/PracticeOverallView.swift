//
//  PracticeOverallView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/13/22.
//

import SwiftUI

struct PracticeOverallView: View {
    let practice: Practice
    @ObservedObject var otracker: PracticeOverallTracker
    @State var useEven: Bool
    @State var animationTracker: Int
    
    init(practice: Practice) {
        self.practice = practice
        useEven = true
        otracker = PracticeOverallTracker(practice: practice)
        animationTracker = -1
    }
    
    var body: some View {
        VStack {
            Group {
                if animationTracker == 0 || animationTracker == 1 {
                    ProgressBarView(curAmount: $otracker.questionsCompleted, total: otracker.shuffledQuestions.count).padding()
                }
                if animationTracker == -1 {
                    VStack( alignment: .leading){
                        Spacer()
                        Image("placeholder").resizable().frame(width: 350, height: 400)
                        if let imgURL = practice.practiceIMGURL {
                            Image(imgURL)
                        } else {
                            //Spacer()
                        }
                        Text(practice.practiceTitle)
                            .font(Font.custom("Avenir-Black", size: 30))
                        Spacer()
                        Button(action: {
                            animationTracker = 0
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.green)
                                Text("Begin Practice")
                                    .font(Font.custom("Avenir-Book", size: 20))
                            }.frame(height: 50)
                        }).buttonStyle(PlainButtonStyle())
                    }
                        .padding()
                        
                }
                else if animationTracker == 0 {
                    PracticeQView(otracker: otracker, useEven: true)
                        
                } else if animationTracker == 1 {
                    PracticeQView(otracker: otracker, useEven: false)
                        
                } else if animationTracker == 2 {
                    VStack {
                        Text("Finished!")
                        Text("Accuracy: " + String(Int(Double(100 * otracker.numCorrect) / Double(otracker.shuffledQuestions.count))) + "%")
                    }
                }
            } .onReceive(otracker.$useEven) { isEven in
                if animationTracker != -1 {
                    animationTracker = isEven ? 0 : 1
                }
            }
            .onReceive(otracker.$showFinishView) { isFinished in
                if isFinished {
                    animationTracker = 2
                }
            }
            .transition(AnyTransition.asymmetric(
                insertion: .move(edge: .trailing),
                removal: .move(edge: .leading)))
            .animation(.default, value: self.animationTracker)
        }
    }
}

    
struct PracticeOverallView_Previews: PreviewProvider {
    static var previews: some View {
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
    }
}
