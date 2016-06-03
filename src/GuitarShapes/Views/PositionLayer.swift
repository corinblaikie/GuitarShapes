import UIKit

class PositionLayer : CALayer {
    
    static var defaultColor = UIColor(red: 100/255, green: 202/255, blue: 255/255, alpha: 255/255)
    static var defaultTextColor = UIColor.blackColor()
    
    var color = defaultColor
    var textColor = defaultTextColor
    var showLabel = true
    var text:String = ""
    var renderingSettings = GuitarRenderingSettings()
    
    var scale = CGFloat(4)
    
    init(position: CGPoint, note: String, color:UIColor, textColor:UIColor) {
        super.init()
        
        self.color = color
        self.textColor = textColor
        self.position = position
        self.bounds = CGRect(x:0, y:0, width: renderingSettings.highlightDiameter * scale, height: renderingSettings.highlightDiameter * scale)
        self.text = note
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawInContext(ctx: CGContext) {
        
        UIGraphicsPushContext(ctx);
        
        CGContextSetLineWidth(ctx, 1.0)
        CGContextSetFillColorWithColor(ctx, color.CGColor)
        CGContextAddEllipseInRect(ctx, self.bounds)
        CGContextFillPath(ctx)
        
        if (self.showLabel) {
            let style:NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
            style.alignment = NSTextAlignment.Center
            
            var fontSize = renderingSettings.highlightDiameter - 12;
            if (fontSize <= 0) {
                fontSize = 8
            }
            let textFontAttributes = [NSFontAttributeName : UIFont.systemFontOfSize(fontSize * scale), NSParagraphStyleAttributeName: style, NSForegroundColorAttributeName : textColor ]
            let x:NSString = self.text
        
            let size = x.sizeWithAttributes(textFontAttributes)
        
            let point = CGPoint(x: (bounds.width / 2.0) - (size.width / 2.0), y: (bounds.height / 2.0) - (size.height / 2.0))

            x.drawAtPoint(point, withAttributes: textFontAttributes)
        }
        
        UIGraphicsPopContext();
    }
}