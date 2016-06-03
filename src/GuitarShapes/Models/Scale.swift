import Foundation


class Scale {
    var name:String
    
    init() {
        name = ""
    }
    
    func positions() -> [FingerPosition] {
        return []
    }
    
    func notes() -> String {
        // returns positions in scale as a list of notes e.g. C, D, E, F, G, A, B, C
        let notes = self.positions().map({ (position: FingerPosition) -> String in position.note })
        return notes.joinWithSeparator(", ")
    }
}

class CMajorScale : Scale {
    
    override init() {
        super.init()
        self.name = "C Major"
    }
    
    override func positions() -> [FingerPosition] {
        // C, D, E, F, G, A, B, C
        return FingerPosition.fromArray([(1,2), (2,-1), (2,1), (2,2), (3,-1), (3,1), (4,-1), (4,0)])
    }
}

class GMajorScale : Scale {
    
    override init() {
        super.init()
        self.name = "G Major"
    }
    
    override func positions() -> [FingerPosition] {
        // G, A, B, C, D, E, F#, G, A, B, C, D, E, F#
        return FingerPosition.fromArray([(0,2), (1,-1), (1,1), (1,2), (2,-1), (2,1), (2,3), (3,-1), (3,1), (4,-1), (4,0), (4,2), (5,-1), (5,1), (5,2)])
    }
}


class DMajorScale : Scale {
    
    override init() {
        super.init()
        self.name = "D Major"
    }
    
    override func positions() -> [FingerPosition] {
        // D, E, F♯, G, A, B, C♯, D
        return FingerPosition.fromArray([(2,-1), (2,1), (2,3),  (3,-1), (3,1), (4,-1), (4,1),  (4,2)])
    }
}

class AMajorScale : Scale {
    
    override init() {
        super.init()
        self.name = "A Major"
    }
    
    override func positions() -> [FingerPosition] {
        // A, B, C#, D, E, F#, G#, A
        return FingerPosition.fromArray([(1,-1), (1,1), (1,3), (2,-1), (2,1), (2,3), (3,0), (3,1)])
    }
}

class EMajorScale : Scale {
    
    override init() {
        super.init()
        self.name = "E Major"
    }
    
    override func positions() -> [FingerPosition] {
        // E, F#, G#, A, B, C#, D#, E
        return FingerPosition.fromArray([(0,-1), (0,1), (0,3), (1,-1), (1,1), (1,3), (2,0), (2,1)])
    }
}