import Foundation

class NotesGameHistory {
    
    private let settings:Settings = Settings.instance
    private var answers:[PositionAnswer] = []
    
    private var positionStats:[FingerPositionStats] = []
    
    func add(answer:PositionAnswer) {
        //store answer
        answers.append(answer)
        
        // calculate score for position
        let previousAnswersForPosition = answers.filter({$0.positionAsked == answer.positionAsked})
        let score = Double(previousAnswersForPosition.filter({$0.correct}).count) / Double(previousAnswersForPosition.count);
        let newStats = FingerPositionStats(position: answer.positionAsked, score: score)
        
        positionStats = positionStats.filter({$0.position != answer.positionAsked}) // remove old position
        positionStats.append(newStats)
    }
    
    func getScoreFor(position:FingerPosition) -> Double {
        return positionStats.filter({$0.position == position}).first?.score ?? 0
    }
    
    func getPositionsByLowestScore() -> [FingerPosition] {
        
        return positionStats.sort({ $0.score < $1.score })
            .filter({ $0.score < 1.0})
            .filter({ settings.isEnabled($0.position.stringIndex, fretIndex: $0.position.fretIndex) })
            .map({$0.position})
    }
    
    func percentCorrect() -> Double {
        return Double(answers.filter({$0.correct}).count) / Double(answers.count)  * 100
    }
}