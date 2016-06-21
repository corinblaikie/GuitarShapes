import Foundation

class ScaleNote {
    let scale:Scale
    let position:Int
    
    init(scale:Scale, position:Int) {
        self.scale = scale
        self.position = position
    }
    
    func note() -> String {
        let index = scale.notes().startIndex.advancedBy(position)
        return scale.notes()[index]
    }
    
    func maskedDescription() -> String {
        return scale.description()
                    .stringByReplacingOccurrencesOfString(note(), withString: "_")
    }
}
