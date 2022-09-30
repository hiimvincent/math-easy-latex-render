//
//  ClearRectView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/18/22.
//

import SwiftUI

struct ClearRectView: View {
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.clear)
            .frame(height: height)
    }
}

//struct ClearRectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClearRectView()
//    }
//}
