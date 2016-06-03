import UIKit

class GuitarLayer : CALayer {
    
    var defaultColor = UIColor(red: 100/255, green: 202/255, blue: 255/255, alpha: 255/255)
    
    let renderingSettings = GuitarRenderingSettings()
    
    var highlightedStringIndex:Int?
    
    func highlightString(stringIndex: Int) {
        highlightedStringIndex = stringIndex
    }
    
    override func drawInContext(context: CGContext) {
        CGContextSaveGState(context)
        
        
        let initY = CGFloat(30.0)
        let initX = (self.frame.width / 2) - ((CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings)/2)
        CGContextTranslateCTM(context, initX, initY)
        
        drawStrings(context)
        
        drawFretts(context)
        
        drawMarkerDots(context)
        
        CGContextRestoreGState(context)
    }
    
    private func drawStrings(context: CGContext) {
        CGContextSetLineWidth(context, 1.0)
        
        for stringIndex in 0...renderingSettings.stringCount {
            
            if (highlightedStringIndex != nil && stringIndex == highlightedStringIndex!) {
                CGContextSetStrokeColorWithColor(context, defaultColor.CGColor)
            }
            else {
                CGContextSetStrokeColorWithColor(context, UIColor.grayColor().CGColor)
            }
            
            let y = CGFloat(0)
            let x = renderingSettings.spaceBetweenStrings * CGFloat(stringIndex)
            CGContextMoveToPoint(context, x, y)
            CGContextAddLineToPoint(context, x, y + renderingSettings.spaceBetweenFrets * CGFloat(renderingSettings.fretCount))
            CGContextStrokePath(context)
        }
    }
    
    private func drawFretts(context: CGContext) {
        
        CGContextSetStrokeColorWithColor(context, UIColor.grayColor().CGColor)
    
        for frettIndex in 0...renderingSettings.fretCount {
            let y = renderingSettings.spaceBetweenFrets * CGFloat(frettIndex)
            let x = CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings
            CGContextMoveToPoint(context, 0, y)
            CGContextAddLineToPoint(context, x, y)
            CGContextStrokePath(context)
        }
    }
    
    private func drawMarkerDots(context: CGContext) {
        
        // draw single dots on guitar neck
        let neckMarkerDotsIndicies = [2, 4, 6, 8, 14, 16, 18, 19]
        for marker in neckMarkerDotsIndicies {
            CGContextSetLineWidth(context, 1.0)
            CGContextSetFillColorWithColor(context, UIColor.grayColor().CGColor)
            let x = (CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings / 2.0) - (renderingSettings.markerDiameter / 2.0)
            let y =  CGFloat(marker) * renderingSettings.spaceBetweenFrets + (renderingSettings.spaceBetweenFrets / 2.0) - (renderingSettings.markerDiameter / 2.0)
            let rectangle = CGRectMake(x, y, renderingSettings.markerDiameter, renderingSettings.markerDiameter)
            CGContextAddEllipseInRect(context, rectangle)
            CGContextFillPath(context)
        }
        
        // draw double dots on guitar neck
        let neckMarkerDoubleDotsIndicies = [11]
        for marker in neckMarkerDoubleDotsIndicies {
            CGContextSetLineWidth(context, 1.0)
            CGContextSetFillColorWithColor(context, UIColor.grayColor().CGColor)
            var x = (CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings / 2.0) - (renderingSettings.markerDiameter / 2.0) + renderingSettings.spaceBetweenStrings
            let y = CGFloat(marker) * renderingSettings.spaceBetweenFrets + (renderingSettings.spaceBetweenFrets / 2.0) - (renderingSettings.markerDiameter / 2.0)
            var rectangle = CGRectMake(x, y, renderingSettings.markerDiameter, renderingSettings.markerDiameter)
            CGContextAddEllipseInRect(context, rectangle)
            CGContextFillPath(context)
            
            x = (CGFloat(renderingSettings.stringCount) * renderingSettings.spaceBetweenStrings / 2.0) - (renderingSettings.markerDiameter / 2.0) - renderingSettings.spaceBetweenStrings
            rectangle = CGRectMake(x, y, renderingSettings.markerDiameter, renderingSettings.markerDiameter)
            CGContextAddEllipseInRect(context, rectangle)
            CGContextFillPath(context)
        }
    }
   
}