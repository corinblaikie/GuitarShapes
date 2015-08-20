import Foundation
import AVFoundation

class NotesGuessingGame {
    private var positionsNotAsked:[FingerPosition] = []
    private var positionsAsked:[FingerPosition] = []
    private var notesGuessed:[String] = []
    private var length = 12
    
    init() {
        positionsNotAsked = createFingerPositions().shuffled().take(self.length)
    }
    
    func currentPosition() -> FingerPosition {
        return positionsNotAsked.first!
    }
    
    func guess(note: String) {
        notesGuessed.append(note)
        positionsAsked.append(positionsNotAsked.removeAtIndex(0))
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
        for (index, guess) in enumerate(notesGuessed) {
            if (guess == positionsAsked[index].note) {
                correct++;
            }
        }
        return correct
    }
    
    func result() -> String {
        return "\(questionsAnsweredCorrectlyCount()) / \(questionsAnsweredCount()) correct answers"
    }
    
    private func createFingerPositions() -> [FingerPosition] {
        var result:[FingerPosition] = []
        
        var guitarStringCount = 6
        var fretLimit = 3 // only asking notes in the few fret
        
        for guitarStringIndex in 0...(guitarStringCount - 1) {
            for fretIndex in -1...fretLimit {
                result.append(FingerPosition(stringIndex:guitarStringIndex, fretIndex: fretIndex))
            }
        }
        
        return result
    }

}