//
//  LessonTestView.swift
//  LatexRender
//
//  Created by Vincent Johnson on 10/1/22.
//

import SwiftUI

struct LessonTestView: View {
    var body: some View {
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

struct LessonTestView_Previews: PreviewProvider {
    static var previews: some View {
        LessonTestView()
    }
}
