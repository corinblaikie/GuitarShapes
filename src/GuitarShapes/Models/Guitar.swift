import Foundation

class Guitar
{
    static let strings:[GuitarString] = [Guitar.lowEString,
                                         Guitar.aString,
                                         Guitar.dString,
                                         Guitar.gString,
                                         Guitar.bString,
                                         Guitar.hightEString] // assuming 6 string guitar
    
    static let lowEString = GuitarString(index: 0, name: Note.e())
    static let aString = GuitarString(index: 1, name: Note.a())
    static let dString = GuitarString(index: 2, name: Note.d())
    static let gString = GuitarString(index: 3, name: Note.g())
    static let bString = GuitarString(index: 4, name: Note.b())
    static let hightEString = GuitarString(index: 5, name: Note.e())
    
    static let notes:[Note] = [
        Note.a(), Note.aSharp(), Note.b(), Note.c(), Note.cSharp(),
        Note.d(), Note.dSharp(), Note.e(), Note.f(), Note.fSharp(),
        Note.g(), Note.gSharp()
    ]
    
    static let stringCount = Guitar.strings.count
    
    func getRandomNote() -> Note {
        return Guitar.notes.randomItem()
    }
}