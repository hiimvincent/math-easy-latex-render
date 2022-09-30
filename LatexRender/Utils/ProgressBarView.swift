//
//  ProgressBarView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/4/22.
//

import SwiftUI

struct ProgressBarView: View {
    //@Binding var value: Float
    @Binding var curAmount: Int
    let total: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                RoundedRectangle(cornerRadius: 45).frame(width: min(CGFloat(Float(self.curAmount) / Float(total))*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.green)
                    .animation(.linear(duration: 0.3), value: curAmount)
            }.cornerRadius(45.0)
        }.frame(height:13)
    }
}

//struct ProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarView()
//    }
//}
