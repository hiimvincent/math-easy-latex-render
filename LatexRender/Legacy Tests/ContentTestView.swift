//
//  ContentTestView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 12/30/21.
//

import SwiftUI

struct ContentTestView: View {
    // Commutative Property Beginner Lesson LaTeX Formatting Test
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("Commutative Property")
                        .font(Font.custom("Soleil-Regular", size: 20))
                        .padding(.vertical)
                    Text("Ever wondered why 1 + 2 is the same as 2 + 1, but 1 - 2 is not 2 - 1? The answer is simple: **the commutative property!** Some things in math are commutative, which is just a fancy way of saying **order doesn’t matter.** On the flipside, if something is not commutative, then **order does matter.** This one concept is the foundation of all of math, so make sure you get it right!")
                        .font(Font.custom("Soleil-Regular", size: 20))
                        .padding(.bottom)
                    Text("Some examples:")
                    HStack {
                        MathView(latex:"$1 + 2 = 2 + 1$")
                        .frame(height: 50.0)
                        MathView(latex:"$1 - 2 \\neq 2 - 1$")
                        .frame(height: 50.0)
                    }
                    HStack {
                        MathView(latex:"$1 \\times 2 = 2 \\times 1$")
                        .frame(height: 50.0)
                        MathView(latex:"$1 \\div 2 \\neq 2 \\div 1$")
                        .frame(height: 50.0)
                    }
                        Group {
                    Text("Here’s the quick and dirty: **addition and multiplication are commutative**, but **subtraction and division are not commutative.**")
                        .padding(.bottom)
                    Text("You probably already knew this without even realizing it! We prepared a few more examples just to prove we’re not tricking you. (Feel free to use a calculator anytime you want, in fact, we actually recommend it!)")
                        .padding(.bottom)
                    }
                    MathView(latex:"$5 + 6 = 6 + 5$  (Both are 11!)").frame(height: 50.0)
                    MathView(latex:"$3 - 1 \\neq 1 - 3$  (Left is 2, Right is -2)").frame(height: 50.0)
                    MathView(latex:"$4 \\times 5 = 5 \\times 4$  (Both are 20!)").frame(height: 50.0)
                }
                
                Group {
                    MathView(latex:"$10 \\div 5 \\neq 5 \\div 10$ (Left is 2, Right is 0.5)").frame(height: 50.0)
                    Text("Lesson Recap:")
                        .underline().padding(.bottom)
                    Text("Commutative - **Order Doesn’t Matter**")
                    ZStack {
                        HStack {
                            List {
                                Section(header: Text("Commutative")) {
                                    Text("Addition")
                                    Text("Multiplication")
                                }
                            }.listStyle(GroupedListStyle())
                                .disabled(true)

                            List {
                                Section(header: Text("Not Commutative")) {
                                    Text("Subtraction")
                                    Text("Division")
                                }
                            }.listStyle(GroupedListStyle())
                                .disabled(true)
                        }.frame(height: 144.0)
                        Rectangle().fill(Color.gray).opacity(0.4).frame(width: CGFloat(1))
                    }.padding(.bottom)
                    
                    Text("That’s it for this lesson! Wasn’t so bad, right? You’ll be surprised to find that **math is a lot easier than you expect!** Later on some concepts may seem intimidating at first, but just remember that math is always built on simple principles like this one. We hope you enjoyed this lesson! Next lesson we will meet the commutative property’s cousin, the distributive property!").padding(.bottom)
                }
            }.padding(.all)
        }
    }
}


struct ContentTestView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTestView()
    }
}
