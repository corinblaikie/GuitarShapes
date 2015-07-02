import UIKit


class GuitarShapeDiagramUIView: UIView {

    var guitarLayer = GuitarLayer()
    var scaleLayer = ScaleLayer()
    private var positions:[FingerPosition] = []
    
    func setPosition(position:FingerPosition) {
        self.setPositions([position]) // syntatic sugar
    }
    
    func setPositions(positions:[FingerPosition]) {
        self.positions = positions
        scaleLayer.setPositions(positions)
    }
    
    var showLabels:Bool = true {
        didSet {
            scaleLayer.showLabels = showLabels
            scaleLayer.setNeedsDisplay()
            self.setNeedsDisplay()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.addSublayer(guitarLayer)
        self.layer.addSublayer(scaleLayer)
    }
    
    override func layoutSubviews() {
        guitarLayer.frame = self.layer.bounds
        scaleLayer.frame = self.layer.bounds
        scaleLayer.setPositions(positions)
        guitarLayer.setNeedsDisplay()
        scaleLayer.setNeedsDisplay()
    }
}



