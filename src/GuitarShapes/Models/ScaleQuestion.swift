import Foundation

class ScaleQuestion {
    let scale:Scale
    var answers:[Note] = []
    let notesToAsk:[Note]
    
    init(scale:Scale) {
        self.scale = scale
        self.notesToAsk = Array(scale.notes()
                                     .filter({$0 != Note.b()  && $0 != Note.e()})
                                     .suffixFrom(1))
    }
    
    func note() -> String {
        let index = notesToAsk.startIndex.advancedBy(answers.count)
        return notesToAsk[index].name()
    }
    
    func answer(note:Note) {
        answers.append(note)
    }
    
    func isComplete() -> Bool {
        return answers.count >= notesToAsk.count
    }
    
    func maskedDescription() -> String {
        
        return scale.maskedDescription(Array(self.notesToAsk.suffixFrom(answers.count)))
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
