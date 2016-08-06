import Foundation

class ScalesGame {
    
    private var questionsIncomplete:[ScaleQuestion] = []
    
    private var questionsComplete:[ScaleQuestion] = []
    
    private var histories = ScalesGameHistoryRepository()
    
    private var history = ScalesGameHistory.instance
    
    private var settings = Settings.instance
    
    init() {
        
        let lowScoringScales = history.getScalesByLowestScore()
            .shuffle()
            .prefix(3)
        
        let randomScales = Scale.all.filter({ settings.isScaleEnabled($0) }).shuffle()
            .shuffle()
            .filter({ !lowScoringScales.contains($0) })
            .prefix(3)
        
        let scales = Array((lowScoringScales + randomScales))
        
        for scale in scales {
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
    
    func scaleScore() -> Double {
        
        if (questionsIncomplete.isEmpty) {
            return 0
        }
        
        return history.getScoreFor(questionsIncomplete.first!.scale)
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
        question.answer(Note.fromName(note))
        
        if (question.isComplete()){
            questionsIncomplete.removeAtIndex(0)
            questionsComplete.append(question)
            history.add(question)
        }
        
        if isOver() {
            histories.Save(history)
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
    
    func getNote(index:Int) -> Note {
        return Guitar.notes[index]
    }
    
    func noteCount() -> Int {
        return Guitar.notes.count
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
