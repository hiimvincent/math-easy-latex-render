```MathEasy``` is an educational iOS app prototype that provides bite-sized math lessons to adult learners on a busy schedule. This repository contains the rendering portion of the app prototype which handles the app UI, visual effects, and equation rendering. Thanks for checking it out.

# Overview

```MathEasy``` is a SwiftUI personal project I worked on from Dec 2021 - Feb 2022 as a way to explore combining the addicting genre of educational games (think Duolinguo!) with the ever growing field of adult mathematics education.

```MathEasy``` uses the ```KaTeX``` JS library to elegantly display complex LaTeX equation strings (using WKWebView) in the form of bite sized lessons and Kahoot-style quizzes to reinforce the lesson content.

```MathEasy``` is able to render grids of equations for mathematical proofs and tables while also being able to render individual equations that fit seamlessly into paragraphs without interfering with formatting or line spacing.

# Formatting LaTeX

LaTeX strings are delimited by ```$``` and individual LaTeX components such as ```times``` are prefaced with two backslashes.

A simple example LaTeX equation string:

```
“$3 \\div 1 \\neq 1 \\div 3$”
```

# Lessons

```Lesson``` content is displayed in progressive tabs from left-to-right. A ```Lesson``` is made of multiple ```LessonComponent```s, which include the render information for each paragraph.

A ```LessonTabView``` displays an entire ```Lesson```.

```swift
let p1 = LessonComponent(id: "01", text: "All squares are rectangles, but not all squares are circles.")
let p2 = LessonComponent(id: "02", text: "The area of a rectangle can be written as:", equationTableLatexStrings: [["$Area = base \\times height$"]])
let p3 = LessonComponent(id: "03", text: "Some important circle formulas include: ", equationTableLatexStrings: [["$C = 2 \\pi R$"], ["$A = \\pi R^2$"]])

let lessonSample = Lesson(name: "Geometry Introduction", description: "An introduction to different mathematical formulas for common shapes.", components: [p1, p2, p3])

LessonTabView(lesson: lessonSample)
```


# Practice

Similar to a ```Lesson```, ```Practice``` is displayed in progressive tabs, except that each tab consists of a question and multiple choice answers. 

A ```Practice``` consists of multiple ```PracticeQuestion```s, which can include a variety of question types. The answers are randomly ordered each time the ```Practice``` is loaded.

A ```PracticeOverallView``` displays an entire ```Practice```.

```swift
let q1 = PracticeQuestion(text: "Is multiplication commutative?", answers: ["Yes", "No"])
let q2 = PracticeQuestion(text: "Evaluate the following", equation: "$5 \\times 13$ =", answers: ["$65$", "$75$", "$70$", "$55$"])
let q3 = PracticeQuestion(text: "Select all multiples of 14", answers: ["$126$", "$98$", "$86$", "$108$"],  answerLastIndex: 1)

let practiceSample = Practice(title: "Multiplication Basics", questions: [q1, q2, q3], useDefaultOrder: true)

PracticeOverallView(practice: practiceSample)
```

# Credit

MathEasty was created by Vincent Johnson.

Rendering Libraries Used:

[KaTeX](https://github.com/KaTeX/KaTeX)

[KaTeX-MathView-Swift](https://github.com/ratala1/KaTeX-MathView-Swift)

