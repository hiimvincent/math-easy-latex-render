//
//  LessonComponentView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/18/22.
//

import SwiftUI

struct LessonComponentView: View {
    let component: LessonComponent
    
    var body: some View {
        VStack {
            if let url = component.imageURL {
                Image(url)
            }
            if let text = component.text {
                let markupText: AttributedString = try! AttributedString(markdown: text)
                Text(markupText)
                    .font(Font.custom("Avenir-Book", size: 20))
                    .padding()
            }
            if let equationTable = component.equationTableLatexStrings {
                ForEach(0..<equationTable.count) { rowIndex in
                    HStack {
                        ForEach(0..<equationTable[rowIndex].count) { colIndex in
                            MathView(latex:centerTag(equationTable[rowIndex][colIndex]))
                                .frame(height: 50)
                                
                        }
                    }.padding(.horizontal)
                }
            }
        }
    }
    
    func centerTag(_ latex: String) -> String {
        return "<div style=\"font-family:Avenir-Book\"><center>" + latex + "</center></div>"
    }
}

//struct LessonComponentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonComponentView()
//    }
//}
