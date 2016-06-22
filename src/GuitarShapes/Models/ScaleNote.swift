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
        var result = scale.description()
        for (index, note) in scale.notes().enumerate() {
            if (index >= position) {
                result = result.stringByReplacingOccurrencesOfString(note, withString: "_")
            }
        }
        
        return result
        
    }
}
