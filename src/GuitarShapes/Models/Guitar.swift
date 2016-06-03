import Foundation

class Guitar
{
    static let strings:[String] = ["E", "A", "D", "G", "B", "E"] // assuming 6 string guitar
    
    static let semitones:[String] = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#" ]
    
    static let stringCount = Guitar.strings.count
    
    static let semitoneCount = Guitar.semitones.count
    
    func getRandomSemitone() -> String {
        return Guitar.semitones.randomItem()
    }
    
    func getSpacesBetween(firstSemitone: String, secondSemitone: String) -> Int {
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
}

class GuitarString {
    
    let index:Int
    let name:String
    
    static let lowEString = GuitarString(index: 0, name: "E")
    static let aString = GuitarString(index: 1, name: "A")
    static let dString = GuitarString(index: 2, name: "D")
    static let gString = GuitarString(index: 3, name: "G")
    static let bString = GuitarString(index: 4, name: "B")
    static let hightEString = GuitarString(index: 5, name: "E")
    
    init(index:Int, name:String) {
        self.index = index
        self.name = name
    }
}