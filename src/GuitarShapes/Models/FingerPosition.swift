import Foundation


public class FingerPosition: Equatable
{
    let fretIndex:Int //Index based on the first fret, open string is -1
    let stringIndex:Int
    let note:String
    
    init (stringIndex: Int, fretIndex: Int)
    {
        self.stringIndex = stringIndex
        self.fretIndex = fretIndex
        self.note = FingerPosition.calculateNote(stringIndex, fretIndex: fretIndex)
    }
    
    static func fromArray(positions:[(Int, Int)]) -> [FingerPosition] {
        // maps from an array Tuples to FingerPositions
        return map (positions) { (p) in FingerPosition(stringIndex: p.0, fretIndex: p.1) }
    }
    
     static func calculateNote(stringIndex: Int, fretIndex: Int) -> String {
        var startingNote = Guitar.strings[stringIndex]
        var startingNoteSemitoneIndex = Guitar.semitones.indexOf(startingNote)
        var semitonesRange = fretIndex % Guitar.semitoneCount + 1  //+1 is to account for index starting at the first fret rather than the open string
        
        if (startingNoteSemitoneIndex! + semitonesRange >= Guitar.semitoneCount) {
            var resultIndex = startingNoteSemitoneIndex! + semitonesRange - Guitar.semitoneCount
            return Guitar.semitones[resultIndex]
        } else {
            var resultIndex = startingNoteSemitoneIndex! + semitonesRange
            return Guitar.semitones[resultIndex]
        }
    }
}

public func ==(lhs: FingerPosition, rhs: FingerPosition) -> Bool {
    return lhs.stringIndex == rhs.stringIndex && lhs.fretIndex == rhs.fretIndex
}

