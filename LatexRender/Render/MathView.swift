//
//  MathView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 12/31/21.
//

import SwiftUI
import UIKit


struct MathView: UIViewRepresentable {
    let latex: String
     
    
    func makeUIView(context: Context) -> KatexMathView {
        let katexView = KatexMathView()
        katexView.loadLatex(latex)
        return katexView
    }
    
    func updateUIView(_ uiView: KatexMathView, context: Context) {
        
    }
    
    func getHeight(_ uiView: KatexMathView) -> Int {
        return uiView.getHeight()
    }
    
    typealias UIViewType = KatexMathView
    
}

struct MathView_Previews: PreviewProvider {
    static var previews: some UIViewRepresentable {
        MathView(latex: "$c = \\pm\\sqrt{a^2 + b^2}")
    }
}
