import Foundation


public class FingerPosition: Equatable
{
    let fretIndex:Int //Index based on the first fret, open string is -1
    let stringIndex:Int
    let note:Note
    
    init (guitarString:GuitarString, note:Note) {
        self.stringIndex = guitarString.index
        
        self.fretIndex = guitarString.indexOf(note)
        self.note = note
    }
    
    init (stringIndex: Int, fretIndex: Int)
    {
        self.stringIndex = stringIndex
        self.fretIndex = fretIndex
        self.note = FingerPosition.calculateNote(stringIndex, fretIndex: fretIndex)
    }
    
    static func fromIndexArray(positions:[(Int, Int)]) -> [FingerPosition] {
        // maps from an array Tuples to FingerPositions
        return positions.map  { (p) in FingerPosition(stringIndex: p.0, fretIndex: p.1) }
    }
    
    static func fromArray(positions:[(GuitarString, String)]) -> [FingerPosition] {
        // maps from an array Tuples to FingerPositions
        return positions.map  { (p) in FingerPosition(guitarString: p.0, note: Note.fromName(p.1)) }
    }
    
     static func calculateNote(stringIndex: Int, fretIndex: Int) -> Note {
        return Guitar.strings[stringIndex].noteAt(fretIndex)
    }
}

public func ==(lhs: FingerPosition, rhs: FingerPosition) -> Bool {
    return lhs.stringIndex == rhs.stringIndex && lhs.fretIndex == rhs.fretIndex
}

