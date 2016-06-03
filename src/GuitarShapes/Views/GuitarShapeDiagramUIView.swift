import UIKit


class GuitarShapeDiagramUIView: UIScrollView {

    var guitarLayer = GuitarLayer()
    var scaleLayer = ScaleLayer()
    private var positions:[FingerPosition] = []
    
    func setPosition(position:FingerPosition, color:UIColor = ScaleLayer.defaultColor, textColor:UIColor = ScaleLayer.defaultTextColor) {
        self.setPositions([position], color: color, textColor: textColor) 
    }
    
    func setPositions(positions:[FingerPosition], color:UIColor = ScaleLayer.defaultColor, textColor:UIColor = ScaleLayer.defaultTextColor) {
        self.positions = positions
        scaleLayer.setPositions(positions, color: color, textColor: textColor)
    }
    
    func highlightString(stringIndex: Int) {
        guitarLayer.highlightString(stringIndex)
        guitarLayer.setNeedsDisplay()
        self.setNeedsDisplay()
    }
    
    var showLabels:Bool = true {
        didSet {
            scaleLayer.showLabels = showLabels
            scaleLayer.setNeedsDisplay()
            self.setNeedsDisplay()
        }
    }
    
    func setTurn(turn:Int, totalTurns:Int) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.addSublayer(guitarLayer)
        self.layer.addSublayer(scaleLayer)
    }
    
    func getFret(y:CGFloat) -> Int {
        return scaleLayer.getFret(y)
    }
    
    override func layoutSubviews() {
        guitarLayer.frame = self.frame
        scaleLayer.frame = self.frame
        scaleLayer.setPositions(positions, color: ScaleLayer.defaultColor, textColor: ScaleLayer.defaultTextColor)
        guitarLayer.setNeedsDisplay()
        scaleLayer.setNeedsDisplay()
    }
}



