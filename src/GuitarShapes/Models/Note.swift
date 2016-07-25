import Foundation

class Note : Equatable
{
    let values:[String]
    private static let separator:String = "/"
    
    init(values:[String]) {
        self.values = values
    }
    
    static func fromName(name:String) -> Note {
        var search = name
        
        if (name.containsString(separator)) {
            search = name.substringToIndex(name.characters.indexOf("/")!)
        }
    
        return Guitar.notes.filter({$0.values.contains(search)}).first!
    }

    func name(preferFlat:Bool = false) -> String {
        if (preferFlat) {
            let flatValue = values.filter({$0.containsString("♭")}).first
            if (flatValue != nil) {
                return flatValue!
            }
        }
        return values[0]
    }
    
    func description() -> String {
        return values.joinWithSeparator(Note.separator)
    }
    
    static func a() -> Note {
        return Note(values:["A"])
    }
    
    static func aSharp() -> Note {
        return Note(values:["A♯", "B♭"])
    }
    
    static func b() -> Note {
        return Note(values:["B", "C♭"])
    }
    
    static func c() -> Note {
        return Note(values:["C", "B♯"])
    }
    
    static func cSharp() -> Note {
        return Note(values:["C♯", "D♭"])
    }
    
    static func d() -> Note {
        return Note(values:["D"])
    }
    
    static func dSharp() -> Note {
        return Note(values:["D♯", "E♭"])
    }
    
    static func e() -> Note {
        return Note(values:["E", "F♭"])
    }
    
    static func f() -> Note {
        return Note(values:["F", "E♯"])
    }
    
    static func fSharp() -> Note {
        return Note(values:["F♯", "G♭"])
    }
    
    static func g() -> Note {
        return Note(values:["G"])
    }
    
    static func gSharp() -> Note {
        return Note(values:["G♯", "A♭"])
    }
}

func ==(lhs: Note, rhs: String) -> Bool {
    return lhs.values.contains(rhs)
}

func ==(lhs: String, rhs: Note) -> Bool {
    return rhs.values.contains(lhs)
}

func !=(lhs: Note, rhs: String) -> Bool {
    return !(lhs==rhs)
}

func !=(lhs: String, rhs: Note) -> Bool {
    return !(lhs==rhs)
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.description() == rhs.description()
}

func !=(lhs: Note, rhs: Note) -> Bool {
    return !(lhs==rhs)
}