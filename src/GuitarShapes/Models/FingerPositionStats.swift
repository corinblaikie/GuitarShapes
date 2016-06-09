import Foundation

class FingerPositionStats {
    let position:FingerPosition
    let score:Double
    
    init(position:FingerPosition, score:Double){
        self.score = score
        self.position = position
    }
}
