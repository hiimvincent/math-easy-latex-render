

import Foundation
import SwiftUI

struct LessonComponent: Identifiable {
    let id: String
    let text: String?
    let imageURL: String?
   // let equationTableDimension: (Int, Int)?
    let equationTableLatexStrings: [[String]]?
    var hasNext: Bool
    //let frameHeight: CGFloat
    
    init (id: String, text: String? = nil, imageURL: String? = nil, equationTableLatexStrings: [[String]]? = nil, hasNext: Bool = true) {
        self.id = id
        self.text = text
        self.imageURL = imageURL
        self.equationTableLatexStrings = equationTableLatexStrings
        self.hasNext = hasNext
        //self.frameHeight = CGFloat(height)
    }
}
