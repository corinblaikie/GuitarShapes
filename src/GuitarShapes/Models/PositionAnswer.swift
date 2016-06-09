import Foundation

class PositionAnswer {
    let positionAsked:FingerPosition
    
    let correct:Bool
    
    init(positionAsked:FingerPosition, correct:Bool){
        self.positionAsked = positionAsked
        self.correct = correct
    }
}