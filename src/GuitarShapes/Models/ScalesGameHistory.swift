import Foundation

class ScalesGameHistory {
    
    private let settings:Settings = Settings.instance
    private var questions:[DateTimeStamped<ScaleQuestion>] = []
    
    private var stats:[ScaleQuestionStats] = []
    
    static let instance = ScalesGameHistory()
    
    private init() {
        // static instance property to be used instead
    }
    
    func add(question:ScaleQuestion) {
        
        //store answer
    
        let stampedQuestion = DateTimeStamped<ScaleQuestion>(value: question)
        questions.append(stampedQuestion)
        
        // calculate score for position
        let questionsForScale = questions.filter({$0.value.scale == question.scale})
        let score = Double(questionsForScale.filter({$0.value.correct()}).count) / Double(questionsForScale.count);
        let newStats = ScaleQuestionStats(scale: question.scale, score: score)
        
        stats = stats.filter({$0.scale != question.scale}) // remove old position
        stats.append(newStats)
    }
    
    func getScoreFor(scale:Scale) -> Double {
        return stats.filter({$0.scale == scale}).first?.score ?? 0
    }
    
    func getScalesByLowestScore() -> [Scale] {
        
        return stats.sort({ $0.score < $1.score })
            .filter({ $0.score < 1.0})
            .map({$0.scale})
    }
    
    func percentCorrect() -> Double {
        return Double(questions.filter({$0.value.correct()}).count) / Double(questions.count)  * 100
    }
}