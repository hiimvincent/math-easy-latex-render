//
//  LessonProgressTracker.swift
//  LatexRender
//
//  Created by Vincent Johnson on 2/1/22.
//

import Foundation

class LessonProgressTracker: ObservableObject {
    let components: [LessonComponent]
    var amountSkipped: Int = 0
    var total: Int = 0
    @Published var index: Int = 0
    @Published var progress: Int = 1
    
    init(components: [LessonComponent]) {
        self.components = components
        for component in components {
            total += component.hasNext ? 1 : 0
        }
        while components[index].hasNext == false && index < components.count - 1 {
            index += 1
            amountSkipped += 1
        }
    }
    
    func increment() {
        progress += 1
        amountSkipped = 0
        var temp = index
        if temp < components.count - 1 {
            temp += 1
            while components[temp].hasNext == false && temp < components.count - 1 {
                temp += 1
                amountSkipped += 1
            }
        }
        index = temp
    }
}
