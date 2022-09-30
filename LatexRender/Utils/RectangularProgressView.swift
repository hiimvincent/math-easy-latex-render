//
//  RectangularProgressView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/27/22.
//

import SwiftUI

struct RectangularProgressView: View {
    let totalRectangles: Int
    @Binding var currentRectangle: Int
    
    var body: some View {
        GeometryReader { geometry in
            let rectangleWidth = geometry.size.width / CGFloat(totalRectangles)
            HStack(spacing: 2) {
                ForEach(0..<totalRectangles, id: \.self) { index in
                Rectangle()
                    .fill(index == currentRectangle ? .green : .black)
                    .frame(width: rectangleWidth - 2, height:10)
                }
                    
            }
        }
    }
}

//struct RectangularProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangularProgressView()
//    }
//}
