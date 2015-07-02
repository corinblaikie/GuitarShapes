import UIKit

class ScaleLayer : CALayer {
    
    var showLabels:Bool = true {
        didSet {
            for layer in self.sublayers as! [PositionLayer] {
                layer.showLabel = showLabels
                layer.setNeedsDisplay()
            }
            self.setNeedsDisplay()
        }
    }
    
    func setPositions(positions:[FingerPosition]) {
        
        self.sublayers?.removeAll()
        
        for (index, position) in enumerate(positions) {
            var layer = PositionLayer(position: getPoint(position), note: position.note)
            layer.showLabel = showLabels
            var fader = CABasicAnimation(keyPath: "opacity")
            fader.duration = 1.0
            fader.beginTime = CACurrentMediaTime() + CFTimeInterval(Float(index))
            fader.fromValue = 0.0
            fader.toValue = 1.0
            fader.removedOnCompletion = false
            fader.fillMode = kCAFillModeForwards
            layer.addAnimation(fader, forKey:"Fade")
            self.addSublayer(layer)
            layer.setNeedsDisplay()
        }
        
    }
    
    func getPoint(position:FingerPosition) -> CGPoint {
        
        var renderingSettings = GuitarRenderingSettings()
        
        
        let initY = CGFloat(30.0) + renderingSettings.highlightDiameter
        let initX = (self.bounds.width / 2) - ((CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings)/2) + renderingSettings.highlightDiameter
        
        var x = CGFloat(position.stringIndex) * renderingSettings.spaceBetweenStrings - renderingSettings.highlightDiameter
        var y = CGFloat(position.fretIndex) * renderingSettings.spaceBetweenFrets + (renderingSettings.spaceBetweenFrets / 2.0) - renderingSettings.highlightDiameter
        
        if (y <= 0) {
            y = 0 - renderingSettings.highlightDiameter
        }
        
        return CGPoint(x: x + initX, y: y + initY)
    }
}