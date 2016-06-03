import UIKit

class ScaleLayer : CALayer {
    
    static var defaultColor = PositionLayer.defaultColor
    static var defaultTextColor = PositionLayer.defaultTextColor
    
    var renderingSettings = GuitarRenderingSettings()
    
    var showLabels:Bool = true {
        didSet {
            for layer in self.sublayers as! [PositionLayer] {
                layer.showLabel = showLabels
                layer.setNeedsDisplay()
            }
            self.setNeedsDisplay()
        }
    }
    
    func setPositions(positions:[FingerPosition], color: UIColor, textColor: UIColor) {
        
        self.sublayers?.removeAll()
        
        for (index, position) in positions.enumerate() {
            let layer = PositionLayer(position: getPoint(position), note: position.note, color: color, textColor: textColor)
            layer.showLabel = showLabels
            layer.allowsEdgeAntialiasing = true
            layer.transform = CATransform3DMakeScale(0.25, 0.25, 1)
            
            let grow = CABasicAnimation(keyPath: "transform.scale")
            //grow.duration = 0.25
            //grow.beginTime = CACurrentMediaTime() + CFTimeInterval(Float(index))
            grow.fromValue = 0.25
            grow.toValue = 1.0
            //grow.removedOnCompletion = false
            //grow.fillMode = kCAFillModeForwards
            //
                
            let group = CAAnimationGroup()
            group.duration = 0.35
            group.animations = [grow]
            group.removedOnCompletion = false
            group.fillMode = kCAFillModeForwards
            group.autoreverses = true
            group.beginTime = CACurrentMediaTime() + CFTimeInterval(Float(index) * 0.35)
            grow.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            layer.addAnimation(group, forKey:"some shite")
            
            
            self.addSublayer(layer)
            layer.setNeedsDisplay()
        }
        
    }
    
    func getFret(y:CGFloat) -> Int {
        
        let initY = CGFloat(30.0)
        
        let fretIndex = (y - initY) / renderingSettings.spaceBetweenFrets
        
        NSLog("\(fretIndex) = (\(y) - \(initY)) / \(renderingSettings.spaceBetweenFrets) ")
        NSLog("fretIndex = (y - initY) / renderingSettings.spaceBetweenFrets")
        
        if (fretIndex < 0) {
            return -1
        }
        
        return Int(floor(fretIndex))
    }
    
    func getPoint(position:FingerPosition) -> CGPoint {
        

        let initY = CGFloat(30.0) + renderingSettings.highlightDiameter
        let initX = (self.bounds.width / 2) - ((CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings)/2) + renderingSettings.highlightDiameter
        
        let x = CGFloat(position.stringIndex) * renderingSettings.spaceBetweenStrings - renderingSettings.highlightDiameter
        var y = CGFloat(position.fretIndex) * renderingSettings.spaceBetweenFrets + (renderingSettings.spaceBetweenFrets / 2.0) - renderingSettings.highlightDiameter
        
        if (y <= 0) {
            y = 0 - renderingSettings.highlightDiameter
        }
        
        return CGPoint(x: x + initX, y: y + initY)
    }
}