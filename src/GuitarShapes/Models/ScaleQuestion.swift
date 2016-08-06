import Foundation

class ScaleQuestion : NSCoder {
    let scale:Scale
    var answers:[Note] = []
    let notesToAsk:[Note]
    
    init(scale:Scale) {
        self.scale = scale
        self.notesToAsk = Array(scale.notes()
                                     .filter({$0 != Note.b()  && $0 != Note.e()})
                                     .suffixFrom(1))
    }
    
    init(coder aDecoder: NSCoder) {
        let scaleName = aDecoder.decodeObjectForKey("scale") as! String
        scale = Scale.fromName(scaleName)
        answers = (aDecoder.decodeObjectForKey("answers") as! [String]).map({Note.fromName($0)})
        notesToAsk = (aDecoder.decodeObjectForKey("notesToAsk") as! [String]).map({Note.fromName($0)})
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(scale.name, forKey: "scale")
        aCoder.encodeObject(answers.map({ return $0.name() }), forKey: "answers")
        aCoder.encodeObject(notesToAsk.map({ return $0.name() }), forKey: "notesToAsk")
    }
    
    func note() -> String {
        let index = notesToAsk.startIndex.advancedBy(answers.count)
        return notesToAsk[index].name()
    }
    
    func answer(note:Note) {
        if (notesToAsk.count > answers.count) {
            answers.append(note)
        }
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
        return incorrectAnswers.count == 0
    }
    
    func hasAnswers() -> Bool {
        return !answers.isEmpty
    }
}
