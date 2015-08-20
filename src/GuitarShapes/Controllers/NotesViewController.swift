import UIKit

class NotesViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var fingerPosition: FingerPosition!
    var game = NotesGuessingGame()
    
    @IBOutlet weak var diagram: GuitarShapeDiagramUIView!
    
    override func viewDidLoad() {
        diagram.setPosition(game.currentPosition())
        diagram.showLabels = false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.noteCount()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(NoteCell.id, forIndexPath: indexPath) as! NoteCell
        var note = game.getNote(indexPath.row)
        cell.setContent(note)
        return cell
    }
    
    @IBAction func onGuess(sender: UIButton) {
        
        var note = sender.titleLabel!.text!
        game.guess(note)
        
        displayGuessFeedback(sender)
        
        if (!game.isOver()) {
            // display next note from game
            diagram.setPosition(game.currentPosition())
            diagram.setNeedsDisplay()
        }
        else {
            var alert = UIAlertView()
            alert.title = game.result()
            alert.addButtonWithTitle("Replay")
            alert.show()
            game = NotesGuessingGame()
            diagram.setPosition(game.currentPosition())
            diagram.setNeedsDisplay()
        }
    }
    
    func displayGuessFeedback(sender: UIButton) {
        
        var currentColor = sender.backgroundColor
        
        // Highlight button green/red based on if answer is correct
        if (game.isLastGuessCorrect()) {
            sender.backgroundColor = UIColor.greenColor()
        } else {
            sender.backgroundColor = UIColor.redColor()
        }
        
        // Fade back to current color
        UIView.animateWithDuration(1, animations:
            { () -> Void in sender.backgroundColor = currentColor})
    }
}



