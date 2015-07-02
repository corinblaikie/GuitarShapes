import UIKit

class PositionLayer : CALayer {
    
    var showLabel = true
    var text:String = ""
    var renderingSettings = GuitarRenderingSettings()
    
    init(position: CGPoint, note: String) {
        super.init()
        
        self.position = position
        self.bounds = CGRect(x:0, y:0, width: renderingSettings.highlightDiameter, height: renderingSettings.highlightDiameter)
        self.text = note
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawInContext(ctx: CGContext!) {
        
        UIGraphicsPushContext(ctx);
        
        CGContextSetLineWidth(ctx, 1.0)
        CGContextSetFillColorWithColor(ctx, UIColor(red: 100/255, green: 202/255, blue: 255/255, alpha: 255/255).CGColor)
        CGContextAddEllipseInRect(ctx, self.bounds)
        CGContextFillPath(ctx)
        
        if (self.showLabel) {
            var style:NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
            style.alignment = NSTextAlignment.Center
            
            let textFontAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(renderingSettings.highlightDiameter - 12), NSParagraphStyleAttributeName: style ]
            var x:NSString = self.text
        
            var size = x.sizeWithAttributes(textFontAttributes)
        
            var point = CGPoint(x: (bounds.width / 2.0) - (size.width / 2.0), y: (bounds.height / 2.0) - (size.height / 2.0))

            x.drawAtPoint(point, withAttributes: textFontAttributes)
        }
        
        UIGraphicsPopContext();
    }
}