import Foundation

class GuitarString {
    
    let index:Int
    let name:Note
    
    init(index:Int, name:Note) {
        self.index = index
        self.name = name
    }
    
    func indexOf(note:Note) -> Int {
        var spaces = getSpacesBetween(self.name, secondSemitone: note)
        
        if (spaces == 12) {
            // reset to open string
            spaces = 0
        }
        
        return spaces - 1 // open string starts at -1
    }
    
    private func getSpacesBetween(firstSemitone: Note, secondSemitone: Note) -> Int {
        
        //TODO: refactor of Guitar.semitones
        
        if let firstIndex = Guitar.semitones.indexOf(firstSemitone) {
            if let secondIndex = Guitar.semitones.indexOf(secondSemitone) {
                if (secondIndex > firstIndex) {
                    return secondIndex - firstIndex
                }
                
                return (Guitar.semitones.count - firstIndex) + secondIndex
            }
        }
        
        return 0
    
    }
    
    func noteAt(fretIndex:Int) -> Note {
        
        let startingNoteSemitoneIndex = Guitar.semitones.indexOf(self.name)
        let semitonesRange = fretIndex % Guitar.semitoneCount + 1  //+1 is to account for index starting at the first fret rather than the open string
        
        if (startingNoteSemitoneIndex! + semitonesRange >= Guitar.semitoneCount) {
            let resultIndex = startingNoteSemitoneIndex! + semitonesRange - Guitar.semitoneCount
            return Guitar.semitones[resultIndex]
        } else {
            let resultIndex = startingNoteSemitoneIndex! + semitonesRange
            return Guitar.semitones[resultIndex]
        }
    }
}