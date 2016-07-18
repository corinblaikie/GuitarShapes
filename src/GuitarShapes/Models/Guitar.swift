import Foundation

class Guitar
{
    static let strings:[GuitarString] = [Guitar.lowEString,
                                         Guitar.aString,
                                         Guitar.dString,
                                         Guitar.gString,
                                         Guitar.bString,
                                         Guitar.hightEString] // assuming 6 string guitar
    
    static let lowEString = GuitarString(index: 0, name: "E")
    static let aString = GuitarString(index: 1, name: "A")
    static let dString = GuitarString(index: 2, name: "D")
    static let gString = GuitarString(index: 3, name: "G")
    static let bString = GuitarString(index: 4, name: "B")
    static let hightEString = GuitarString(index: 5, name: "E")
    
    static let semitones:[String] = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯" ]
    
    static let stringCount = Guitar.strings.count
    
    static let semitoneCount = Guitar.semitones.count
    
    func getRandomSemitone() -> String {
        return Guitar.semitones.randomItem()
    }
}