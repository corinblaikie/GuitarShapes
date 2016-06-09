import Foundation

class NoteGuessingGameHistory {
    
    private let settings:Settings = Settings.instance
    private var answers:[Answer] = []
    private var positions:[FingerPositionStats] = []
    
    func Add(answer:Answer) {
        //store answer
        answers.append(answer)
        
        // calculate score for position
        let previousAnswersForPosition = answers.filter({$0.positionAsked == answer.positionAsked})
        let score = Double(previousAnswersForPosition.filter({$0.correct}).count) / Double(previousAnswersForPosition.count);
        let newStats = FingerPositionStats(position: answer.positionAsked, score: score)
        
        positions = positions.filter({$0.position != answer.positionAsked}) // remove old position
        positions.append(newStats)
    }
    
    func GetScoreFor(position:FingerPosition) -> Double {
        return positions.filter({$0.position == position}).first?.score ?? 0
    }
    
    func GetPositionsByLowestScore() -> [FingerPosition] {
        
        return positions.sort({ $0.score < $1.score })
            .filter({ $0.score < 1.0})
            .filter({ settings.isEnabled($0.position.stringIndex, fretIndex: $0.position.fretIndex) })
            .map({$0.position})
    }
}