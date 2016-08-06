import Foundation

protocol NotePreferences {
    var preferBFlat:Bool { get }
    var preferBSharp:Bool { get }
    
    var preferEFlat:Bool { get }
    var preferESharp:Bool { get }
    
    var preferSharps:Bool { get }
    var preferFlats:Bool { get }
}

class Scale : Equatable, NotePreferences {
    let name:String
    let positions:[FingerPosition]
    
    let preferBFlat:Bool
    let preferBSharp:Bool
    
    let preferEFlat:Bool
    let preferESharp:Bool
    
    let preferSharps:Bool
    let preferFlats:Bool
    
    init(name:String,
         positions:[FingerPosition],
         preferBFlat:Bool = false,
         preferBSharp:Bool = false,
         preferEFlat:Bool = false,
         preferESharp:Bool = false,
         preferFlats:Bool = false,
         preferSharps:Bool = false) {
        self.name = name
        self.positions = positions
        self.preferFlats = preferFlats || name.containsString("♭")
        self.preferSharps = preferSharps || name.containsString("♯")
        self.preferBFlat = preferBFlat || name.containsString("♭")
        self.preferBSharp = preferBSharp || name.containsString("♯")
        self.preferEFlat = preferEFlat || name.containsString("♭")
        self.preferESharp = preferESharp || name.containsString("♯")
    }
    
    static let all = [Scale.aFlatMajor,
                Scale.aMajor,
                Scale.bFlatMajor,
                Scale.bMajor,
                Scale.cMajor,
                Scale.cSharpMajor,
                Scale.dFlatMajor,
                Scale.dMajor,
                Scale.eFlatMajor,
                Scale.eMajor,
                Scale.fMajor,
                Scale.fSharpMajor,
                Scale.gFlatMajor,
                Scale.gMajor ]
    
    func description() -> String {
        // returns positions in scale as string e.g. "C, D, E, F, G, A, B, C"
        let notes = self.positions.map({ (position: FingerPosition) -> String in position.note.name(self) })
        return notes.joinWithSeparator(", ")
    }
    
    func maskedDescription(notesToMask:[Note]) -> String {
        return notes().map({notesToMask.contains($0) ? "_" : $0.name(self) }).joinWithSeparator(", ")
    }
    
    func notes() -> [Note] {
        // returns positions in scale as a list of notes e.g. [C, D, E, F, G, A, B, C]
        return positions.map({ (position: FingerPosition) -> Note in position.note })
    }
    
    static func fromName(name:String) -> Scale {
        return all.filter({$0.name == name})[0]
    }
    
    static let aFlatMajor = Scale(
        name: "A♭ Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G")
        ])
    )
    
    
    static let aMajor = Scale(
        name: "A Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯")
        ])
    )
    
    static let bFlatMajor = Scale(
        name: "B♭ Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A")
        ])
    )
    
    static let bMajor = Scale(
        name: "B Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯"),
            (Guitar.gString, "A♯")
        ])
    )
    
    static let cMajor = Scale(
        name: "C Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A"),
            (Guitar.bString, "B")
        ])
    )
    
    static let cSharpMajor = Scale(
        name: "C♯ Major",
        positions: FingerPosition.fromArray([
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E♯"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯"),
            (Guitar.gString, "A♯"),
            (Guitar.bString, "B♯")
        ])
    )
    
    static let dFlatMajor = Scale(
        name: "D♭ Major",
        positions: FingerPosition.fromArray([
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G♭"),
            (Guitar.gString, "A♭"),
            (Guitar.bString, "B♭"),
            (Guitar.bString, "C")
        ])
    )
    
    static let dMajor = Scale(
        name: "D Major",
        positions: FingerPosition.fromArray([
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A"),
            (Guitar.bString, "B"),
            (Guitar.bString, "C♯")
        ])
    )
    
    static let eFlatMajor = Scale(
        name: "E♭ Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "E♭"),
            (Guitar.lowEString, "F"),
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D")
        ])
    )
    
    static let eMajor = Scale(
        name: "E Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "E"),
            (Guitar.lowEString, "F♯"),
            (Guitar.lowEString, "G♯"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯")
        ])
    )
    
    static let fSharpMajor = Scale(
        name: "F♯ Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "F♯"),
            (Guitar.lowEString, "G♯"),
            (Guitar.aString, "A♯"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E♯")
        ])
    )
    
    static let fMajor = Scale(
        name: "F Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "F"),
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E")
        ]),
        preferBFlat: true
    )
    
    static let gFlatMajor = Scale(
        name: "G♭ Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "G♭"),
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C♭"),
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F")
        ])
    )
    
    
    static let gMajor = Scale(
        name: "G Major",
        positions: FingerPosition.fromArray([
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.bString, "F♯")
        ])
    )
}


func ==(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.name == rhs.name
}

func !=(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.name != rhs.name
}