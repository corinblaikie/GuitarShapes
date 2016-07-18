import Foundation

class ScaleQuestion {
    let scale:Scale
    var answers:[String] = []
    let notesToAsk:[String]
    
    init(scale:Scale) {
        self.scale = scale
        self.notesToAsk = Array(scale.notes().filter({$0 != "B" && $0 != "E"}).suffixFrom(1))
    }
    
    func note() -> String {
        let index = notesToAsk.startIndex.advancedBy(answers.count)
        return notesToAsk[index]
    }
    
    func answer(note:String) {
        answers.append(note)
    }
    
    func isComplete() -> Bool {
        return answers.count >= notesToAsk.count
    }
    
    func maskedDescription() -> String {
        var result = scale.description()
        for (index, note) in notesToAsk.enumerate() {
            if (index >= answers.count) {
                result = result.stringByReplacingOccurrencesOfString(note, withString: "_")
            }
        }
        
        return result
    }
    
    func isLastGuessCorrect() -> Bool {
        return notesToAsk[answers.count - 1] == answers.last
    }
    
    func correct() -> Bool {
        let incorrectAnswers = answers.enumerate().filter({notesToAsk[$0] != $1})
        return incorrectAnswers.count > 0
    }
    
    func hasAnswers() -> Bool {
        return !answers.isEmpty
    }
}
