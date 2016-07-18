import Foundation
import AVFoundation

class NotesGame {
    
    private var positionsNotAsked:[FingerPosition] = []
    private var positionsAsked:[FingerPosition] = []
    private var notesGuessed:[String] = []
    private var settings:Settings = Settings.instance
    private var history:NotesGameHistory
    
    
    let lowScoringTurns = 6
    let otherTurns = 6
    var totalTurns = 12
    
    init(history:NotesGameHistory) {
        self.history = history
        
        let lowScoringPositions = history.getPositionsByLowestScore()
                                         .shuffle()
                                         .prefix(lowScoringTurns)
        
        let randomPositions = self.createFingerPositions()
                                  .shuffle()
                                  .filter({ !lowScoringPositions.contains($0) })
                                  .prefix(otherTurns)
        
        positionsNotAsked = Array((lowScoringPositions + randomPositions))
    }
    
    func turn() -> Int {
        return positionsAsked.count + 1
    }
    
    func currentPosition() -> FingerPosition {
        return positionsNotAsked.first!
    }
    
    func guess(note: String) {
        notesGuessed.append(note)
        let position = positionsNotAsked.removeAtIndex(0)
        positionsAsked.append(position)
        let answer = PositionAnswer(positionAsked: position, correct: isLastGuessCorrect())
        history.add(answer)
    }
    
    func isOver() -> Bool {
        return positionsNotAsked.isEmpty
    }
    
    func isLastGuessCorrect() -> Bool {
        return notesGuessed.last! == positionsAsked.last!.note
    }
    
    func getNote(index:Int) -> String {
        return Guitar.semitones[index]
    }
    
    func noteCount() -> Int {
        return Guitar.semitoneCount
    }
    
    func questionsCount() -> Int {
        return positionsAsked.count + positionsNotAsked.count
    }
    
    func questionsAnsweredCount() -> Int {
        return notesGuessed.count
    }
    
    func questionsAnsweredCorrectlyCount() -> Int {
        var correct = 0
        for (index, guess) in notesGuessed.enumerate() {
            if (guess == positionsAsked[index].note) {
                correct += 1;
            }
        }
        return correct
    }
    
    func correctPositions() -> [FingerPosition] {
        var result = [FingerPosition]()
        for (index, guess) in notesGuessed.enumerate() {
            if (guess == positionsAsked[index].note) {
                result.append(positionsAsked[index])
            }
        }
        return result
    }
    
    func incorrectPositions() -> [FingerPosition] {
        var result = [FingerPosition]()
        for (index, guess) in notesGuessed.enumerate() {
            if (guess != positionsAsked[index].note) {
                result.append(positionsAsked[index])
            }
        }
        return result
    }
    
    func result() -> String {
        return "\(questionsAnsweredCorrectlyCount()) / \(questionsAnsweredCount()) correct answers"
    }
    
    private func createFingerPositions() -> [FingerPosition] {
        var result:[FingerPosition] = []
        
        let guitarStringCount = 6
        let fretLimit = settings.getMaxFret() - 1
        
        for guitarStringIndex in 0...(guitarStringCount - 1) {
            
            for fretIndex in -1...fretLimit {
                let position = FingerPosition(stringIndex:guitarStringIndex, fretIndex: fretIndex)
                if (settings.isEnabled(position.stringIndex, fretIndex: position.fretIndex)) {
                    result.append(position)
                }
            }
        }
        
        return result
    }

}




