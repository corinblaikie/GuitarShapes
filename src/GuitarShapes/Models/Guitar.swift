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