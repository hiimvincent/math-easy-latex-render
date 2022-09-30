//
//  PracticeView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/2/22.
//

import SwiftUI

struct PracticeView: View {
    let practice: Practice
    @ObservedObject var tracker: PracticeTracker
    @State var toggleView: Bool = true
    @State var hasStartedToggle: Bool = false
    
    init(practice: Practice) {
        self.practice = practice
        self.tracker = PracticeTracker(questions: self.practice.questions, numQuestionPerPractice: practice.numQuestionsPerPractice, useDefaultOrder: practice.useDefaultOrder)
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
        VStack {
            if !hasStartedToggle {
                VStack( alignment: .leading){
                    if let imgURL = practice.practiceIMGURL {
                        Image(imgURL)
                    } else {
                        Spacer()
                    }
                    Text(practice.practiceTitle)
                        .font(Font.custom("Avenir-Black", size: 30))
    //                Text(lesson.lessonDescription)
    //                    .font(Font.custom("Avenir-Book", size: 20))
                    Spacer()
                    Button(action: {
                        withAnimation {
                            hasStartedToggle = true
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.green)
                            Text("Begin Practice")
                                .font(Font.custom("Avenir-Book", size: 20))
                        }.frame(height: 50)
                    }).buttonStyle(PlainButtonStyle())
                }.padding().transition(.opacity)
        } else if !tracker.showFinishView {
            VStack {
                ProgressBarView(curAmount: $tracker.questionsCompleted, total: tracker.questions.count)
            VStack {
                if toggleView {
                    PracticeQuestionView(tracker: self.tracker, currentQuestion: tracker.currentQuestion, answers: tracker.answers, indices: tracker.shuffleIndices).transition(AnyTransition.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
                } else {
                    PracticeQuestionView(tracker: self.tracker, currentQuestion: tracker.currentQuestion, answers: tracker.answers, indices: tracker.shuffleIndices).transition(AnyTransition.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
                }
            }.animation(.default, value: self.toggleView)
                .onReceive(tracker.$animationSwitch) { animationSwitch in
                    self.toggleView = animationSwitch
                }
                HStack {
                    Button(action: {
                        //reveal answer
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                            Text("Show Answer")
                                .font(Font.custom("Avenir-Book", size: 20))
                                .foregroundColor(.black)
                        }.frame(height: 50)
                    }).buttonStyle(PlainButtonStyle()).padding(.trailing, 4.0)
                        .padding(.leading)
                        .padding(.bottom)
                        .padding(.top, 2.0)
                    Button(action: {
                        if tracker.hasFinished {
                            tracker.showFinishView = true
                        } else if tracker.isCorrect {
                            tracker.animationSwitch.toggle()
                            //let seconds = 1.0
                            //DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                tracker.nextQuestion()
                            //}
                        } else {
                            tracker.submit()
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                            Text(tracker.hasFinished ? "Finish" : tracker.isCorrect ? "Next": "Submit")
                                .font(Font.custom("Avenir-Book", size: 20))
                                .foregroundColor(.white)
                        }.frame(height: 50)
                    }).buttonStyle(PlainButtonStyle())
                        .padding(.leading, 4.0)
                        .padding(.trailing)
                        .padding(.bottom)
                        .padding(.top, 2.0)
                }
            }
        } else {
            VStack {
                Text("Finished!")
                Text("Accuracy: " + String(Int(Double(100 * tracker.numCorrect) / Double(tracker.questions.count))) + "%")
            }
        }
        }
        }.animation(.linear(duration:0.5), value: hasStartedToggle)
    }
}

struct PracticeView_Previews: PreviewProvider {
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
        PracticeView(practice: p)
    }
}
