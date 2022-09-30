//
//  LessonTabView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/18/22.
//

import SwiftUI

struct LessonTabView: View {
    let lesson: Lesson
    @StateObject var lessonInfo = LessonInfo()

    var body: some View {
        IntermediateTabView(lesson: lesson).environmentObject(lessonInfo)
    }


}

struct IntermediateTabView: View {
    @State private var isPresented = false
    @EnvironmentObject var lessonInfo: LessonInfo
    let lesson: Lesson
    
    var body: some View {
        if !lessonInfo.isFinished {
            VStack(alignment: .leading) {
                Spacer()
                Image("placeholder").resizable().frame(width: 350, height: 400)
                if let imgURL = lesson.lessonIMGURL {
                    //Image(imgURL)
                } else {
                    Spacer()
                }
                Text(lesson.lessonName)
                    .font(Font.custom("Avenir-Black", size: 30))
                Text(lesson.lessonDescription)
                    .font(Font.custom("Avenir-Book", size: 20))
                Spacer()
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.green)
                        Text("Begin Lesson")
                            .font(Font.custom("Avenir-Book", size: 20))
                    }.frame(height: 50)
                }).buttonStyle(PlainButtonStyle())
            }.padding()
//            Button("Present!") {
//                    isPresented.toggle()
//            }
            .fullScreenCover(isPresented: $isPresented, content: { FullScreenModalView(lesson: lesson)})
            Spacer()
        } else {
            FinishView()
        }
    }
}

class LessonInfo: ObservableObject {
    @Published var isFinished = false
    
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var lessonInfo: LessonInfo
    @State private var selectedTab = 0
    @State var progress: Int = 0
    let lesson: Lesson
    let numOfComponentGroups: Int
    let groupIndices: [Int]

    init(lesson: Lesson) {
        self.lesson = lesson
        var total = 0
        var gIndices: [Int] = [0]
        for index in 0..<lesson.components.count {
            if lesson.components[index].hasNext {
                total += 1
                gIndices.append(index + 1)
            }
        }
        self.groupIndices = gIndices
        self.numOfComponentGroups = total
    }

    var body: some View {

        ZStack {
            Color("BackColor1").edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                //.renderingMode(.original)
                        })
                            
                        Spacer()
                        Text(lesson.lessonName).font(Font.custom("Avenir-Black", size: 25))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 5)
                    RectangularProgressView(totalRectangles: numOfComponentGroups, currentRectangle: $progress).frame(height:15).padding(.horizontal)
                }
                TabView(selection: $selectedTab) {
                    ForEach(0..<numOfComponentGroups, id:\.self) { index in
                        VStack {
                            //scrollview?
                            ForEach(groupIndices[index]..<groupIndices[index+1], id:\.self) { gIndex in
                                LessonComponentView(component: lesson.components[gIndex])
                            }
                        }.gesture(DragGesture()) //disable swiping
                        .tag(index)
                    }
                }
                        .tabViewStyle(.page)
                HStack {
                    Button(action: {
                        if selectedTab > 0 {
                            withAnimation {
                                selectedTab -= 1
                                progress -= 1
                            }
                        }
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                            Text("Back")
                                .font(Font.custom("Avenir-Book", size: 20))
                                .foregroundColor(.white)
                        }.frame(height: 50)
                    })
                    Button(action: {
                        if selectedTab < numOfComponentGroups - 1 {
                            withAnimation {
                                selectedTab += 1
                                progress += 1
                            }
                        } else if selectedTab == numOfComponentGroups - 1 {
                            withAnimation {
                                lessonInfo.isFinished.toggle()
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }, label: {
                        if selectedTab < numOfComponentGroups - 1 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.blue)
                                Text("Next")
                                    .font(Font.custom("Avenir-Book", size: 20))
                                    .foregroundColor(.white)
                            }.frame(height: 50)
                        } else if selectedTab == numOfComponentGroups - 1 {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.green)
                                Text("Finish")
                                    .font(Font.custom("Avenir-Book", size: 20))
                                    .foregroundColor(.white)
                            }.frame(height: 50)
                        }
                    })
                }.padding()
            }
        }
    }
}

struct LessonTabView_Previews: PreviewProvider {
    static var previews: some View {
        let c1 = LessonComponent(id: "01", text: "There are **four basic operations** in math: addition(+), subtraction(-), multiplication(\u{D7}), and division(\u{F7}). Each one has special properties, the most fundamental of which is called the **commutative property**.", hasNext: false)

        let c2 = LessonComponent(id: "01", text: "Ever wondered why 1 + 2 is the same as 2 + 1, but 1 - 2 isn’t 2 - 1? The answer is simple: the **commutative property!** Some operations are commutative, which is just a fancy way of saying **order doesn’t matter.** On the flipside, if something isn’t commutative, then the order does matter. This one concept is the foundation of all of math, so make sure you get it right!")

        let c3 = LessonComponent(id: "02", text: "Some examples:", equationTableLatexStrings: [["$1 + 2 = 2 + 1$", "$1 - 2 \\neq 2 - 1$"], ["$1 + 2 = 2 + 1$","$1 \\div 2 \\neq 2 \\div 1$"]], hasNext: false)

        let c4 = LessonComponent(id:"03", text:"Here’s the quick and dirty: **addition and multiplication are commutative**, but **subtraction and division are not commutative.**")

        let c5 = LessonComponent(id: "04", text: "You probably already knew this without even realizing it! We prepared a few more examples just to prove we’re not tricking you. (Feel free to use a calculator anytime you want, in fact, we actually recommend it!)", equationTableLatexStrings: [["$5 + 6 = 6 + 5$ (both are 11)"], ["$3 - 1 \\neq 1 - 3$ (left is 2, right is -2)"], ["$4 \\times 5 = 5 \\times 4$ (both are 20)"],["$10 \\div 5 \\neq 5 \\div 10$ (left is 2, right is 0.5)"]])

        let c6 = LessonComponent(id:"05", text:"**Note**: The one exception to this rule is if the first and second number are the same. In this case you are allowed to switch the order for both subtraction and division! But, since both numbers are the same, it doesn’t mean anything to switch the order so no need to worry about memorizing this exception!", equationTableLatexStrings: [["$3 \\div 3 = 3 \\div 3$ (Both are 1)"], ["$3 - 3 = 3 - 3$ (Both are 0)"]])

        let c7 = LessonComponent(id: "06", text: "**Lesson Recap:**",hasNext: false)

        let c8 = LessonComponent(id: "06", text: "*Four Operations*: +, -, \u{D7}, \u{F7}",hasNext: false)
        let c9 = LessonComponent(id: "06", text: "*Commutative*: Order Doesn’t Matter", hasNext: false)
        let c10 = LessonComponent(id: "06", text: "*Not Commutative*: Order Does Matter", equationTableLatexStrings: [["<b><u>Commutative</u></b>", "<b><u>Not Commutative</u></b>"], ["Addition", "Subtraction"], ["Multiplication", "Division"]])

        let c11 = LessonComponent(id:"07", text:"That’s it for this lesson! Wasn’t so bad, right? You’ll be surprised to find that **math is a lot easier than you expect!** Later on some concepts may seem intimidating at first, but just remember that math is always built on simple principles like this one. We hope you enjoyed this lesson! Next lesson we will meet the commutative property’s close cousin, the distributive property!")
        let testLesson = Lesson(name: "Distributive Property", description: "Learn about the distributive property, the commutative property's close cousin.", components: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11])
        LessonTabView(lesson: testLesson)
    }
}
