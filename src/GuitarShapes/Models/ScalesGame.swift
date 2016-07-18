import Foundation

class ScalesGame {
    
    private var questionsIncomplete:[ScaleQuestion] = []
    
    private var questionsComplete:[ScaleQuestion] = []
    
    private var history = ScalesGameHistory.instance
    
    init() {
        
        let allScales:[Scale] = [Scale.cMajor(), Scale.dMajor(), Scale.eMajor(), Scale.aMajor(), Scale.gMajor() ]
        
        for scale in allScales.shuffle() {
            let question = ScaleQuestion(scale: scale)
            questionsIncomplete.append(question)
        }
    }
    
    func notesDescription() -> String {
        
        if (questionsIncomplete.isEmpty) {
            return ""
        }
        
        return questionsIncomplete.first!.maskedDescription()
    }
    
    func scaleName() -> String {
        return (questionsIncomplete.first?.scale.name) ?? ""
    }
    
    func turn() -> Int {
        return questionsComplete.count + 1
    }
    
    func currentScale() -> ScaleQuestion {
        return questionsIncomplete.first!
    }
    
    func guess(note: String) {
        let question = questionsIncomplete.first!
        question.answer(note)
        
        if (question.isComplete()){
            questionsIncomplete.removeAtIndex(0)
            questionsComplete.append(question)
            history.add(question)
        }
    }
    
    func isOver() -> Bool {
        return questionsIncomplete.isEmpty
    }
    
    func isLastGuessCorrect() -> Bool {
        
        if ((!questionsIncomplete.isEmpty) && questionsIncomplete.first!.hasAnswers()) {
            return questionsIncomplete.first!.isLastGuessCorrect()
        }
        
        return questionsComplete.last?
                                .isLastGuessCorrect() ?? false
    }
    
    func getNote(index:Int) -> String {
        return Guitar.semitones[index]
    }
    
    func noteCount() -> Int {
        return Guitar.semitoneCount
    }
    
    func questionsCount() -> Int {
        return questionsComplete.count + questionsIncomplete.count
    }
    
    func questionsAnsweredCount() -> Int {
        return questionsComplete.count
    }
 
    func questionsAnsweredCorrectlyCount() -> Int {
        return questionsComplete.filter({ $0.correct() }).count
    }
    
    func previousNotesDescription() -> String {
        return questionsComplete.last!.maskedDescription()
    }
    
    func previousScaleName() -> String {
        return questionsComplete.last!.scale.name
    }
}
