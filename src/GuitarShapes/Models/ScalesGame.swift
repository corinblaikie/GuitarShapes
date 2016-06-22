import Foundation

class ScalesGame {
    
    let totalTurns:Int = 12
    
    private var scaleNotesToAsk:[ScaleNote] = []
    
    private var scaleNotesAsked:[ScaleNote] = []
    
    private var notesGuessed:[String] = []
    
    init() {
        let allScales:[Scale] = [CMajorScale(), DMajorScale(), EMajorScale(), AMajorScale(), GMajorScale() ]
        
        for scale in allScales {
            for (index, _) in scale.notes().enumerate() {
            
                let scaleNote = ScaleNote(scale: scale, position: index)
        
                if (index != 0 && scaleNote.note() != "B" && scaleNote.note() != "E") {
                    scaleNotesToAsk.append(scaleNote)
                }
            }
        
        }
    }
    
    func notesDescription() -> String {
        
        if (scaleNotesToAsk.isEmpty) {
            return ""
        }
        
        return scaleNotesToAsk.first!.maskedDescription()
    }
    
    func scaleName() -> String {
        return (scaleNotesToAsk.first?.scale.name) ?? ""
    }
    
    func turn() -> Int {
        return scaleNotesAsked.count + 1
    }
    
    func currentScale() -> ScaleNote {
        return scaleNotesToAsk.first!
    }
    
    func guess(note: String) {
        notesGuessed.append(note)
        
        let scaleNote = scaleNotesToAsk.removeAtIndex(0)
        scaleNotesAsked.append(scaleNote)
    }
    
    func isOver() -> Bool {
        return scaleNotesToAsk.isEmpty
    }
    
    func isLastGuessCorrect() -> Bool {
        return notesGuessed.last! == scaleNotesAsked.last!.note()
    }
    
    func getNote(index:Int) -> String {
        return Guitar.semitones[index]
    }
    
    func noteCount() -> Int {
        return Guitar.semitoneCount
    }
    
    func questionsCount() -> Int {
        return scaleNotesAsked.count + scaleNotesToAsk.count
    }
    
    func questionsAnsweredCount() -> Int {
        return notesGuessed.count
    }
 
    func questionsAnsweredCorrectlyCount() -> Int {
        var correct = 0
        for (index, guess) in notesGuessed.enumerate() {
            if (guess == scaleNotesAsked[index].note()) {
                correct += 1;
            }
        }
        return correct
    }
}
