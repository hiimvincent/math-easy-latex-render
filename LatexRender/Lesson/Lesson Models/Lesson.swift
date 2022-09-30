//
//  Lesson.swift
//  LatexRender
//
//  Created by Vincent Johnson on 1/30/22.
//

import Foundation

struct Lesson {
    let lessonName: String
    let lessonDescription: String
    let lessonIMGURL: String?
    let components: [LessonComponent]
    
    init(name: String, description: String, url: String? = nil, components: [LessonComponent]) {
        self.lessonName = name
        self.lessonDescription = description
        self.lessonIMGURL = url
        self.components = components
    }
    
    
    
}
