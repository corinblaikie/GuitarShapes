import UIKit

class GuitarRenderingSettings {
    
    let stringCount:Int
    
    let fretCount:Int
    
    let spaceBetweenStrings:CGFloat
    
    let spaceBetweenFrets:CGFloat
    
    let markerDiameter:CGFloat
    
    let highlightDiameter:CGFloat
    
    init(scale:CGFloat = 0.4) {
        self.stringCount = 5
        self.fretCount =  20
        self.spaceBetweenStrings = 40 * scale
        self.spaceBetweenFrets = 100 * scale
        self.markerDiameter = self.spaceBetweenStrings / 2
        self.highlightDiameter = self.spaceBetweenStrings * 0.75
    }
}