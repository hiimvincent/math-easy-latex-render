//
//  LineBreakTestView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 1/1/22.
//

import SwiftUI

struct LineBreakTestView: View {
    // Test for line breaks in MathView
    var body: some View {
        MathView(latex: "Here’s the quick and dirty: addition and multiplication are commutative, $1 + 1 = 2$ <b> but </b> subtraction <span style=\"color: #ff0000\">January 30, 2011</span> and division are not commutative.")
    }
}

struct LineBreakTestView_Previews: PreviewProvider {
    static var previews: some View {
        LineBreakTestView()
    }
}
