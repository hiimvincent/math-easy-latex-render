//
//  PracticeQView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/13/22.
//

import SwiftUI

struct PracticeQView: View {
    @ObservedObject var otracker: PracticeOverallTracker
    let useEven: Bool
    
    var body: some View {
        VStack {
            let currentQuestion = useEven ? otracker.evenQuestion() : otracker.oddQuestion()
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
            let numA = useEven ? otracker.shuffledIndicesEven.count : otracker.shuffledIndicesOdd.count
            ForEach(0..<numA, id:\.self) { index in
                let isCorrect = useEven ? otracker.isCorrectEven && otracker.selectionEven[index]![0] : otracker.isCorrectOdd && otracker.selectionOdd[index]![0]
                let isSelected = useEven ? otracker.selectionEven[index]![1] : otracker.selectionOdd[index]![1]
                let answerLatex = useEven ? currentQuestion.answerLatexStrings[otracker.shuffledIndicesEven[index]] : currentQuestion.answerLatexStrings[otracker.shuffledIndicesOdd[index]]
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.clear)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isCorrect ? Color.green : isSelected ? Color.blue: Color.gray, lineWidth: 2)
                    //tracker.shuffleIndices[index]]
                    UpdaterView(latex: answerLatex)
                        .offset(y: answerLatex.first == "$" ? -8 : -3)
                }.frame(height:50)
                .onTapGesture (perform: {
                    if useEven && !otracker.isCorrectEven {
                        if currentQuestion.correctAnswerLastIndex == 0 {
                            otracker.clearSelection(isEven: useEven)
                        }
                        otracker.selectionEven[index]![1] = !otracker.selectionEven[index]![1]
                    } else if !useEven && !otracker.isCorrectOdd {
                        if currentQuestion.correctAnswerLastIndex == 0 {
                            otracker.clearSelection(isEven: useEven)
                        }
                        otracker.selectionOdd[index]![1] = !otracker.selectionOdd[index]![1]
                    }
                        
                })
                .padding(5)
                .padding(.horizontal)
                
            }
            VStack {
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
                        let isCorrect = useEven ? otracker.isCorrectEven : otracker.isCorrectOdd
                        if otracker.hasFinished {
                            otracker.showFinishView = true
                        } else if isCorrect {
                            otracker.nextQuestion()
                        } else {
                            otracker.submit(isEven: useEven)
                        }
                    }, label: {
                        let isCorrect = useEven ? otracker.isCorrectEven : otracker.isCorrectOdd
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                            Text(otracker.hasFinished ? "Finish" : isCorrect ? "Next": "Submit")
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
        }
    }
}
//
//struct PracticeQView_Previews: PreviewProvider {
//    static var previews: some View {
//        PracticeQView()
//    }
//}
