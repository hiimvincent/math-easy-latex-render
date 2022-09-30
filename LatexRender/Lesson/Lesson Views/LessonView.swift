//
//  LessonView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/1/22.
//

import SwiftUI

struct LessonView: View {
    let lesson: Lesson
    @State var hasStarted: Bool = false
    @State var scrollButtonToggleTest: Bool = true
    @ObservedObject var tracker: LessonProgressTracker
    
    init(lesson: Lesson) {
        self.lesson = lesson
        tracker = LessonProgressTracker(components: self.lesson.components)
    }
    
    var body: some View {
        if !hasStarted {
            VStack(alignment: .leading) {
                if let imgURL = lesson.lessonIMGURL {
                    Image(imgURL)
                } else {
                    Spacer()
                }
                Text(lesson.lessonName)
                    .font(Font.custom("Avenir-Black", size: 30))
                Text(lesson.lessonDescription)
                    .font(Font.custom("Avenir-Book", size: 20))
                Spacer()
                Button(action: {
                    hasStarted = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.green)
                        Text("Begin Lesson")
                            .font(Font.custom("Avenir-Book", size: 20))
                    }.frame(height: 50)
                }).buttonStyle(PlainButtonStyle())
            }.padding()
            
        } else {
            VStack {
                Text(lesson.lessonName)
                    .font(Font.custom("Avenir-Black", size: 25))
                ProgressBarView(curAmount: $tracker.progress, total: tracker.total)
                    .offset(y: -10)
                let limit = tracker.index + 2
                ScrollViewReader { value in
                    GeometryReader { geometry in
                        ScrollView {
                            VStack {
                                Text(String(Int(geometry.size.height)))
//                                ComplexTestView(component: lesson.components[0])
//                                    .id(0)
//                                ComplexTestView(component: lesson.components[1])
//                                    .id(1)
//                            ForEach(0..<limit, id:\.self) { index in
//                                var component = lesson.components[index]
//                                //var frameOffsetHeight: CGFloat = geometry.size.height - component.frameHeight
//                                VStack {
//                                    ComplexTestView(component: component)
////                                    if index < tracker.index && lesson.components[index].hasNext {
////                                        ClearRectView(height: 100)
////                                    }
////                                    else
//                                        if index >= lesson.components.count - 1 || index >= tracker.index {
//                                        ClearRectView(height: 100)
//                                            .onAppear(perform: {
//                                                withAnimation {
//                                                    value.scrollTo(tracker.index - tracker.amountSkipped, anchor: .top)
//                                                }
//                                            })
////                                    } else if index >= tracker.index {
////                                        ClearRectView(height: frameOffsetHeight)
////                                            .onAppear(perform: {
////                                                withAnimation {
////                                                    value.scrollTo(tracker.index - tracker.amountSkipped, anchor: .top)
////                                                }
////                                            })
////                                    }
//                                    }
//                                }.id(index)
//                            }
                            }
                        }
                    
//                    if tracker.index >= lesson.components.count - 1 {
//                        Button(action: {
//                            //open practice
//                        }, label: {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .foregroundColor(.black)
//                                Text("Practice")
//                                    .font(Font.custom("Avenir-Book", size: 20))
//                                    .foregroundColor(.white)
//                            }.frame(height: 50)
//                        }).buttonStyle(PlainButtonStyle()).padding()
//                    } else if scrollButtonToggleTest {
//                        Button(action: {
//                            withAnimation {
//                                tracker.increment()
//                                value.scrollTo(tracker.index - tracker.amountSkipped, anchor: .top)
//                            }
//                        }, label: {
//                            HStack {
//                                Spacer()
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .foregroundColor(.blue)
//                                    Text("Next")
//                                        .font(Font.custom("Avenir-Book", size: 20))
//                                }.frame(height: 50)
//
//                            }
//                        })
//                            .buttonStyle(PlainButtonStyle()).padding()

//                    }
                }
                }
            }
        }
    }
}

//struct LessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        let c1 = LessonComponent(id:"05", text:"<p>Like the commutative property, the <b>distributive property</b> is another fundamental property of math. At its core, it just explains what happens when we need to <b>add and multiply</b> or <b>subtract and multiply</b> numbers together. We’ll dive deeper into what this means exactly, but first let’s look at a few examples!</p>", height: 310)
//        let c2 = LessonComponent(id: "02", text: "", equationTableLatexStrings:[["$3 \\times (2 + 4) = (3 \\times 2) + (3 \\times 4)$"], ["$= (6) + (12) = 18$"], ["$10 \\times (4 - 1) = (10 \\times 4) - (10 \\times 1)$"], ["$= (40) - (10) = 30$"]]
//       , hasNext: false, height: 1)
//        let c3 = LessonComponent(id:"03", text:"<p><u>Note</u>: In math, parentheses are a special signal that tell us what to <b>solve first</b>. Parentheses take priority over everything else in math, which means whatever is inside the parentheses always gets first dibs.</p>", height: 200)
//        let c4 = LessonComponent(id:"04", text:"<p style=\"margin-bottom:30px\">Notice how the first number spreads out, or <i>distributes</i>? This property is an extremely useful tool for <b>simplifying complex equations</b> into <b>simple parts</b>. The strategy for using the distributive property is simple - <i>divide and conquer</i>. By breaking down a complex equation, it makes it easier for us to solve! Let’s look at the first example again, this time taking note of each step:</p><div style=\"font-size: 15px\"><p><b>1.</b> Original expression:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$3 \\times (2 + 4) =$</p><p><b>2.</b> Distribute outside three: $(3 \\times 2) + (3 \\times 4) =$</p><p><b>3.</b> Multiply inside numbers: $(6) + (12) =$</p><p><b>4.</b> Add/Subtract leftovers:&nbsp;&nbsp;&nbsp;&nbsp;$18$</p></div>", height: 440)
//        let c5 = LessonComponent(id:"05", text:"<p>What makes the distributive property even more useful is that we're not limited to just two numbers inside the parenthesis, we can have <b>as many numbers as we want</b>. Remember that the multiplication always has to go outside the parentheses though! Here's a slightly more intricate example:</p>", equationTableLatexStrings: [["$4 \\times (3 - 2 + 1) = $"], ["$(4 \\times 3) - (4 \\times 2) + (4 \\times 1) =$"], ["$(12) - (8) + (4) = 8$"]], height: 215)
//        let c6 = LessonComponent(id:"05", text:"<p>As long as we follow the four general steps, there's no limit to how many numbers we can use. There is a catch though! We can only use this tool when we are <b>adding or subtracting numbers inside the parenthesis</b>, it won’t work with multiplication or division. See how the distributive property fails when we try to use it with multiplication:</p>", equationTableLatexStrings: [["$4 \\times (3 \\times 2) \\neq (4 \\times 3) \\times (4 \\times 2)$"], ["<b>Left Side</b>: $4 \\times (3 \\times 2)$"], ["$= 4 \\times (6) = 24$"], ["<b>Right Side</b>: $(4 \\times 3) \\times (4 \\times 2)$"], ["= $(12) \\times (8) = 96$"]], height: 240)
//        let c7 = LessonComponent(id:"05", text:"<p>The two sides give <u>completely different answers</u>! So we just need to keep in mind that the inside is for addition and subtraction only. Also, in case you were curious, we can absolutely use the <i>commutative property</i> together with the <i>distributive property</i>. In fact, math is all about combining small, simple ideas to solve complex problems!</p>", height: 250)
//
//        let testLesson = Lesson(name: "Distributive Property", description: "Learn about the distributive property, the commutative property's close cousin.", components: [c1, c2, c3, c4, c5, c6, c7])
//        LessonView(lesson: testLesson)
//            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
//    }
//}
