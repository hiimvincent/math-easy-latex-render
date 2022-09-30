//
//  PracticeQuestionView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/2/22.
//

import SwiftUI

struct PracticeQuestionView: View {
    @ObservedObject var tracker: PracticeTracker
    var currentQuestion: PracticeQuestion
    var answers: [String]
    var indices: [Int]
    
//    init(tracker: PracticeTracker) {
//        self.tracker = tracker
//        currentQuestion = tracker.currentQuestion
//    }
    
    var body: some View {
        //ScrollView {
            VStack {
                Text(currentQuestion.questionText)
                    .font(Font.custom("Avenir-Book", size: 22))
                if let equation = currentQuestion.questionEquation {
                    UpdaterView(latex: equation).frame(height:50)
                }
                if let url = currentQuestion.questionIMGURL {
                    Image(url)
                }
                Spacer()
                //indices.count
                ForEach(0..<answers.count, id:\.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.clear)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(tracker.isCorrect && tracker.selection[index]![0] ? Color.green : tracker.selection[index]![1] ? Color.blue: Color.gray, lineWidth: 2)
                        //tracker.shuffleIndices[index]]
                        UpdaterView(latex: answers[indices[index]])
                            .offset(y: answers[indices[index]].first == "$" ? -8 : -3)
                    }.frame(height:50)
                    .onTapGesture (perform: {
                        if !tracker.isCorrect {
                            if currentQuestion.correctAnswerLastIndex == 0 {
                                tracker.clearSelection()
                            }
                            tracker.selection[index]![1] = !tracker.selection[index]![1]
                        }
                    })
                    .padding(5)
                    .padding(.horizontal)
                    
                }
            }
    }
}

//struct PracticeQuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        let p1 = PracticeQuestion(text: "Which of these isn't commutative?", answers: ["Addition", "Subtraction", "Multiplication", "Division"])
//        PracticeQuestionView(question: p1)
//    }
//}
