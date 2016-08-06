import Foundation

import Foundation
import UIKit
import CoreMedia

class ScalesGameHistoryRepository {
    
    private let libraryDirectory = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)[0]
    private let file = "/scalesgamehistory.plist"
    
    func Get() -> ScalesGameHistory {
        let data = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryDirectory + file)
        if (data != nil) {
            return data as! ScalesGameHistory
        }
        
        return ScalesGameHistory()
    }
    
    func Save(history:ScalesGameHistory) {
       let result = NSKeyedArchiver.archiveRootObject(history, toFile: libraryDirectory + file)
       NSLog("Saving scales history: \(result)")
    }
}

class ScalesGameHistory : NSCoder {
    
    private let settings:Settings = Settings.instance
    private var questions:[ScaleQuestion] = []
    
    private var stats:[ScaleQuestionStats] = []
    
    static let instance = ScalesGameHistoryRepository().Get()

    struct PropertyKey {
        static let questionsKey = "quesitons"
        //static let statsKey = "statsKey"
    }
    
    override init() {
    }
    
    init(coder aDecoder: NSCoder) {
        questions = aDecoder.decodeObjectForKey(PropertyKey.questionsKey) as! [ScaleQuestion]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(questions, forKey: PropertyKey.questionsKey)
    }
    
    
    func add(question:ScaleQuestion) {
        
        //store answer
        
        
        questions.append(question)
        
        // calculate score for position
        let questionsForScale = questions.filter({$0.scale == question.scale})
        let score = Double(questionsForScale.filter({$0.correct()}).count) / Double(questionsForScale.count);
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
        return Double(questions.filter({$0.correct()}).count) / Double(questions.count)  * 100
    }
}