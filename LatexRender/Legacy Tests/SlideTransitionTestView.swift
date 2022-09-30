//
//  SlideTransitionTestView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/4/22.
//

import SwiftUI


struct SlideTransitionTestView: View {
    // Test for Lesson Slide Transitions
    @State var page: Int = 0
    @ObservedObject var model = smallModel()
    //@State var count: Int = 111111111111
    @State private var isBack = false   // << reverse flag (not animatable)
        
    var body: some View {
        VStack {
//            HStack {
//                Button(action: {
//                    self.isBack = true
//                    self.page = self.page - 1
//                }) {
//                    Text("Back")
//                }
//
//                Spacer()
//
//                Button(action: {
//                    self.isBack = false
//                    self.page = self.page + 1
//                    model.count += 11111111111
//                }) {
//                    Text("Next")
//                }
//            }
//            Spacer()

//            Group {
            VStack {
                if page == 0 {
                    VStack( alignment: .leading){
                        Text("Abcdef")
                            .font(Font.custom("Avenir-Black", size: 30))
//                        Text(lesson.lessonDescription)
//                            .font(Font.custom("Avenir-Book", size: 20))
                        Spacer()
                        Button(action: {
                            self.page = self.page + 1
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.green)
                                Text("Begin Practice")
                                    .font(Font.custom("Avenir-Book", size: 20))
                            }.frame(height: 50)
                        }).buttonStyle(PlainButtonStyle())
                    }.padding()
                } else { Spacer() }
//                    } else if page == 1 {
//                        ZStack {
////                            Rectangle().frame(height:200)
////                                .foregroundColor(.green)
//                            Text(String(model.count))
//                        }
//                    } else if page == 2 {
//                        ZStack {
////                            Rectangle().frame(height:200)
////                                .foregroundColor(.blue)
//                            Text(String(model.count))//, color: .systemBlue)
//                        }
//                    }
            }.transition(AnyTransition.asymmetric(
                insertion:.move(edge: isBack ? .leading : .trailing),
                removal: .move(edge: isBack ? .trailing : .leading))
            )
            .animation(.default, value: self.page)   // << animate here by value
        }
    }
}

class smallModel: ObservableObject {
    @Published var count = 11111111111
}

struct SlideTransitionTestView_Previews: PreviewProvider {
    static var previews: some View {
        SlideTransitionTestView()
    }
}



