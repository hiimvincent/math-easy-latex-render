//
//  UpdaterView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/3/22.
//

import SwiftUI
import UIKit


struct UpdaterView: UIViewRepresentable {
    var latex: String
    
    func makeUIView(context: Context) -> KatexMathView {
        let katexView = KatexMathView()
        katexView.loadLatex(latexConversion(s: latex))
        return katexView
    }
    
    func latexConversion(s: String) -> String {
        return "<div style=\"text-align: center; font-family:Avenir-Book\"><p>" + s + "</p></div>"
    }
    
    func updateUIView(_ uiView: KatexMathView, context: Context) {
        uiView.loadLatex(latexConversion(s: latex))
    }
    
//    func getHeight(_ uiView: KatexMathView) -> Int {
//        return uiView.getHeight()
//    }
    
    typealias UIViewType = KatexMathView
    
}

//struct UpdaterView_Previews: PreviewProvider {
//    static var previews: some UIViewRepresentable {
//        UpdaterView(latex: "$c = \\pm\\sqrt{a^2 + b^2}")
//    }
//}

