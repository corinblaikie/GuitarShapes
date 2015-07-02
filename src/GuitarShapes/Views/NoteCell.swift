import UIKit

class NoteCell : UICollectionViewCell {
    
    static let id = "NoteCellId"
    
    @IBOutlet var button: UIButton!
    
    func setContent(content:String) {
        self.button.setTitle(content, forState: UIControlState.Normal)
    }
}