import Foundation


class Scale : Equatable {
    let name:String
    let positions:[FingerPosition]
    
    init(name:String, positions:[FingerPosition]) {
        self.name = name
        self.positions = positions
    }
    
    private func isFlat() -> Bool {
        return name.containsString("♭")
    }
    
    static func all() -> [Scale] {
        return [Scale.aFlatMajor(),
                Scale.aMajor(),
                Scale.bFlatMajor(),
                Scale.bMajor(),
                Scale.cMajor(),
                Scale.cSharpMajor(),
                Scale.dFlatMajor(),
                Scale.dMajor(),
                Scale.eFlatMajor(),
                Scale.eMajor(),
                Scale.fMajor(),
                Scale.fSharpMajor(),
                Scale.gFlatMajor(),
                Scale.gMajor() ]
        
    }
    
    func description() -> String {
        // returns positions in scale as string e.g. "C, D, E, F, G, A, B, C"
        let preferFlat = self.isFlat()
        let notes = self.positions.map({ (position: FingerPosition) -> String in position.note.name(preferFlat) })
        return notes.joinWithSeparator(", ")
    }
    
    func maskedDescription(notesToMask:[Note]) -> String {
        let preferFlat = self.isFlat()
        return notes().map({notesToMask.contains($0) ? "_" : $0.name(preferFlat) }).joinWithSeparator(", ")
    }
    
    func notes() -> [Note] {
        // returns positions in scale as a list of notes e.g. [C, D, E, F, G, A, B, C]
        return positions.map({ (position: FingerPosition) -> Note in position.note })
    }
    
    static func aFlatMajor() -> Scale {
        // ???
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G")
            ])
        
        return Scale(name: "A♭ Major", positions: scalePositions)
    }
    
    static func aMajor() -> Scale {
        // A, B, C♯, D, E, F♯, G♯
        
        // positions = FingerPosition.fromIndexArray([(1,-1), (1,1), (1,3), (2,-1), (2,1), (2,3), (3,0)])
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯")
            ])
        return Scale(name: "A Major", positions: scalePositions)
    }
    
    static func bFlatMajor() -> Scale {
        // ???
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A")
            ])
        
        return Scale(name: "B♭ Major", positions: scalePositions)
    }
    
    static func bMajor() -> Scale {
        // B, C♯, D♯, E, F♯, G♯, A♯
        
        // let positions = FingerPosition.fromIndexArray([])
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯"),
            (Guitar.gString, "A♯")
            ])
        
        return Scale(name: "B Major", positions: scalePositions)
    }
    
    static func cMajor() -> Scale {
        // C, D, E, F, G, A, B
        //let positions = FingerPosition.fromIndexArray([(1,2), (2,-1), (2,1), (2,2), (3,-1), (3,1), (4,-1)])
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A"),
            (Guitar.bString, "B")
        ])
            
        return Scale(name: "C Major", positions: scalePositions)
    }
    
    static func cSharpMajor() -> Scale {
        // ???
        let scalePositions = FingerPosition.fromArray([
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E♯"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G♯"),
            (Guitar.gString, "A♯"),
            (Guitar.bString, "B♯")
            ])
        
        return Scale(name: "C♯ Major", positions: scalePositions)
    }
    
    static func dFlatMajor() -> Scale {
        // ???
        let scalePositions = FingerPosition.fromArray([
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            (Guitar.gString, "G♭"),
            (Guitar.gString, "A♭"),
            (Guitar.bString, "B♭"),
            (Guitar.bString, "C")
            ])
        
        return Scale(name: "D♭ Major", positions: scalePositions)
    }
    
    static func dMajor() -> Scale {
        // D, E, F♯, G, A, B, C♯
        
        // let positions = FingerPosition.fromIndexArray([(2,-1), (2,1), (2,3),  (3,-1), (3,1), (4,-1), (4,1)])
        let scalePositions = FingerPosition.fromArray([
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.dString, "F♯"),
            (Guitar.gString, "G"),
            (Guitar.gString, "A"),
            (Guitar.bString, "B"),
            (Guitar.bString, "C♯")
            ])
        
        return Scale(name: "D Major", positions: scalePositions)
    }
    
    static func eFlatMajor() -> Scale {
        // ???
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "E♭"),
            (Guitar.lowEString, "F"),
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D")
            ])
        return Scale(name: "E♭ Major", positions: scalePositions)
    }
    
    static func eMajor() -> Scale {
        // E, F♯, G♯, A, B, C♯, D♯
        
        // let positions = FingerPosition.fromIndexArray([(0,-1), (0,1), (0,3), (1,-1), (1,1), (1,3), (2,0)])
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "E"),
            (Guitar.lowEString, "F♯"),
            (Guitar.lowEString, "G♯"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯")
            ])
        
        return Scale(name: "E Major", positions: scalePositions)
    }
    
    static func fSharpMajor() -> Scale {
        
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "F♯"),
            (Guitar.lowEString, "G♯"),
            (Guitar.aString, "A♯"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C♯"),
            (Guitar.dString, "D♯"),
            (Guitar.dString, "E♯"),
            ])
        
        return Scale(name: "F♯ Major", positions: scalePositions)
    }
    
    
    
    static func fMajor() -> Scale {
        
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "F"),
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E")
            ])
        
        return Scale(name: "F Major", positions: scalePositions)
    }
    
    
    static func gFlatMajor() -> Scale {
        
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "G♭"),
            (Guitar.aString, "A♭"),
            (Guitar.aString, "B♭"),
            (Guitar.aString, "C♭"),
            (Guitar.dString, "D♭"),
            (Guitar.dString, "E♭"),
            (Guitar.dString, "F"),
            ])
        
        return Scale(name: "G♭ Major", positions: scalePositions)
    }
    
    
    static func gMajor() -> Scale {
        // G, A, B, C, D, E, F♯
        
        //let positions = FingerPosition.fromIndexArray([(0,2), (1,-1), (1,1), (1,2), (2,-1), (2,1), (2,3)]
        let scalePositions = FingerPosition.fromArray([
            (Guitar.lowEString, "G"),
            (Guitar.aString, "A"),
            (Guitar.aString, "B"),
            (Guitar.aString, "C"),
            (Guitar.dString, "D"),
            (Guitar.dString, "E"),
            (Guitar.bString, "F♯")
        ])
        
        return Scale(name: "G Major", positions: scalePositions)
    }
}


func ==(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.name == rhs.name
}

func !=(lhs: Scale, rhs: Scale) -> Bool {
    return lhs.name != rhs.name
}