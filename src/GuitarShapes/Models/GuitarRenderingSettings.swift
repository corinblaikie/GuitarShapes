import UIKit

class GuitarRenderingSettings {
    
    let stringCount:Int
    
    let fretCount:Int
    
    let spaceBetweenStrings:CGFloat
    
    let spaceBetweenFrets:CGFloat
    
    let markerDiameter:CGFloat
    
    let highlightDiameter:CGFloat
    
    init(stringCount:Int = 5, fretCount:Int = 20, spaceBetweenStrings:CGFloat = 40.0, spaceBetweenFrets:CGFloat = 120.0) {
        self.stringCount = stringCount
        self.fretCount =  fretCount
        self.spaceBetweenStrings = spaceBetweenStrings
        self.spaceBetweenFrets = spaceBetweenFrets
        self.markerDiameter = spaceBetweenStrings / 2
        self.highlightDiameter = spaceBetweenStrings * 0.75
    }
}