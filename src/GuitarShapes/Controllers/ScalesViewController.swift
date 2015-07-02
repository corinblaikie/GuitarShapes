import UIKit

class ScalesViewController : UIViewController {
    
    var scales: [Scale] = [CMajorScale(), GMajorScale(), DMajorScale(), EMajorScale(), AMajorScale()]
    var shuffledScales: [Scale] = []
    var scale: Scale!
    
    @IBOutlet weak var diagram: GuitarShapeDiagramUIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet var notesLabel: UILabel!
    
    override func viewDidLoad() {
        refresh()
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    
    @IBAction func onSwipe(sender: UISwipeGestureRecognizer) {
        if (diagram.hidden) {
            return; // only respond to swipes when diagram is visible
        }
        refresh()
    }
    
    func refresh() {
        if (shuffledScales.isEmpty) {
            shuffledScales = scales.shuffled()
        }
        
        scale = shuffledScales.removeLast()
        nameLabel.text = "\(self.scale.name)"
        notesLabel.text = "(\(self.scale.notes()))"
        diagram.setPositions(self.scale.positions())
        diagram.setNeedsDisplay()
    }
}