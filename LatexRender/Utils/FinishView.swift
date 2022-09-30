//
//  FinishView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 3/30/22.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        VStack {
            Text("Lesson Completed!")
                .font(Font.custom("Avenir-Black", size: 30))
            HStack {
                Text("Lesson Reward").font(Font.custom("Avenir-Book", size: 19))
                Spacer()
                Text("200").font(Font.custom("Avenir-Book", size: 19))
                Image("diamond").resizable().frame(width: 23, height: 33)
            }.padding(.horizontal, 25)
            HStack {
                Text("Chapter Bonus").font(Font.custom("Avenir-Book", size: 19))
                Spacer()
                Text("100").font(Font.custom("Avenir-Book", size: 19))
                Image("diamond").resizable().frame(width: 23, height: 33)
            }.padding(.horizontal, 25)
            HStack {
                Text("1.5x Boost").font(Font.custom("Avenir-Book", size: 19))
                Spacer()
                Text("100").font(Font.custom("Avenir-Book", size: 19))
                Image("diamond").resizable().frame(width: 23, height: 33)
            }.padding(.horizontal, 25)
            HStack {
                Text("Daily Lesson Reward").font(Font.custom("Avenir-Book", size: 19))
                Spacer()
                Text("5").font(Font.custom("Avenir-Book", size: 19))
                Image("ruby").resizable().frame(width: 27, height: 36)
            }.padding(.horizontal, 25)
            Divider().background(.black).padding(.horizontal, 22)
            HStack {
                Text("Total").font(Font.custom("Avenir-Book", size: 19))
                Spacer()
                Text("5").font(Font.custom("Avenir-Book", size: 19))
                Image("ruby").resizable().frame(width: 27, height: 36)
                Text("400").font(Font.custom("Avenir-Book", size: 19))
                Image("diamond").resizable().frame(width: 23, height: 33)
            }.padding(.horizontal, 25)
        }
        
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
