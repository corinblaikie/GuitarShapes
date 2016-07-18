import Foundation

class DateTimeStamped<T> {
    let value:T
    let occuredOn:NSDate
    
    init(value:T, occuredOn:NSDate = NSDate()) {
        self.value = value
        self.occuredOn = occuredOn
    }
}

class ScaleQuestionStats {
    let scale:Scale
    let score:Double
    
    init(scale:Scale, score:Double) {
        self.scale = scale
        self.score = score
    }
}