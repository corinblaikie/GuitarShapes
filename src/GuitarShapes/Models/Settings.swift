import Foundation

class SettingsRepository {
    
    private let libraryDirectory = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)[0]
    private let file = "/settings.plist"
    
    func Get() -> Settings {
        let data = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryDirectory + file)
        if (data != nil) {
            return data as! Settings
        }
        
        return Settings()
    }
    
    func Save(settings:Settings) {
        let result = NSKeyedArchiver.archiveRootObject(settings, toFile: libraryDirectory + file)
        NSLog("Saving settings: \(result)")
    }
}

class Settings : NSCoder {
    
    static let instance = SettingsRepository().Get()

    private var stringsEnabled:[Bool] = [Bool](count:6, repeatedValue: true)
    private var fretsEnabled:[Int] = [-1,0,1,2,3,4,5,6,7,8,9,10,11,12]
    
    private var onlyMarkerFrets:Bool = false
    
    private var minFret:Int = 0
    private var maxFret:Int = 12
    private var markerFretIndexes = [2, 4, 6, 8, 11, 14, 16, 18, 19]
    
    private var scalesEnabled:[Bool] = [Bool](count:Scale.all.count, repeatedValue: true)
    
    override init() {
    }
    
    init(coder aDecoder: NSCoder) {
        stringsEnabled = aDecoder.decodeObjectForKey("stringsEnabled") as! [Bool]
        onlyMarkerFrets = aDecoder.decodeObjectForKey("onlyMarkerFrets") as! Bool
        minFret = aDecoder.decodeObjectForKey("minFret") as! Int
        maxFret = aDecoder.decodeObjectForKey("maxFret") as! Int
        scalesEnabled = aDecoder.decodeObjectForKey("scalesEnabled") as! [Bool]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(stringsEnabled, forKey: "stringsEnabled")
        aCoder.encodeObject(onlyMarkerFrets, forKey: "onlyMarkerFrets")
        aCoder.encodeObject(minFret, forKey: "minFret")
        aCoder.encodeObject(maxFret, forKey: "maxFret")
        aCoder.encodeObject(scalesEnabled, forKey: "scalesEnabled")
    }
    
    func getMarkerFrets() -> Bool {
        return onlyMarkerFrets
    }
    
    func getMinFret() -> Int {
        return minFret;
    }
    
    func getMaxFret() -> Int {
        return maxFret;
    }
    
    func setMinFret(value:Int) {
        minFret = value
        updateFrets()
    }
    
    func setMaxFret(value:Int) {
        maxFret = value
        updateFrets()
    }
    
    func isStringEnabled(guitarString:GuitarString) -> Bool {
        return stringsEnabled[guitarString.index]
    }
    
    func isScaleEnabled(scale:Scale) -> Bool {
        let index = Scale.all.indexOf(scale)!
        return scalesEnabled[index]
    }
    
    func toggleScale(scale:Scale, enabled:Bool) {
        let index = Scale.all.indexOf(scale)!
        scalesEnabled[index] = enabled
    }
    
    func toggleString(guitarString:GuitarString, enabled:Bool) {
        stringsEnabled[guitarString.index] = enabled
        updateFrets()
    }
    
    func toggleMarkerFrets(value:Bool) {
        onlyMarkerFrets = value
        updateFrets()
    }
    
    func isEnabled(stringIndex:Int, fretIndex:Int) -> Bool {
        return stringsEnabled[stringIndex] && fretsEnabled.contains(fretIndex)
    }
    
    private func updateFrets() {
        self.fretsEnabled = []
        
        for index in -1...11 {
            if ((index >= minFret) && (index <= maxFret) && !restrictedByOnlyMarkerFrets(index)) {
                fretsEnabled.append(index)
            }
        }
    }
    
    private func restrictedByOnlyMarkerFrets(fretIndex:Int) -> Bool {
        
        return onlyMarkerFrets && !markerFretIndexes.contains(fretIndex)
    }
}