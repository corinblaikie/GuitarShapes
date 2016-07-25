import Foundation

class GuitarString {
    
    let index:Int
    let name:Note
    
    init(index:Int, name:Note) {
        self.index = index
        self.name = name
    }
    
    func indexOf(note:Note) -> Int {
        var spaces = getSpacesBetween(self.name, second: note)
        
        if (spaces == Guitar.notes.count) {
            // reset to open string
            spaces = 0
        }
        
        return spaces - 1 // open string starts at -1
    }
    
    private func getSpacesBetween(first: Note, second: Note) -> Int {
        
        if let firstIndex = Guitar.notes.indexOf(first) {
            if let secondIndex = Guitar.notes.indexOf(second) {
                if (secondIndex > firstIndex) {
                    return secondIndex - firstIndex
                }
                
                return (Guitar.notes.count - firstIndex) + secondIndex
            }
        }
        
        return 0
    
    }
    
    func noteAt(fretIndex:Int) -> Note {
        
        let startIndex = Guitar.notes.indexOf(self.name)!
        let noteRangeCount = fretIndex % Guitar.notes.count + 1  //+1 is to account for index starting at the first fret rather than the open string
        
        if (startIndex + noteRangeCount >= Guitar.notes.count) {
            let resultIndex = startIndex + noteRangeCount - Guitar.notes.count
            return Guitar.notes[resultIndex]
        } else {
            let resultIndex = startIndex + noteRangeCount
            return Guitar.notes[resultIndex]
        }
    }
}