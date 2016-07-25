import UIKit

class NotesViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var fingerPosition: FingerPosition!
    var history = NotesGameHistory()
    var game:NotesGame! = nil
    
    @IBOutlet weak var diagram: GuitarShapeDiagramUIView!
    
    @IBOutlet var buttons: UICollectionView!
    
    override func viewDidLoad() {
        reset()
    }
    
    override func viewDidAppear(animated: Bool) {
        reset()
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.noteCount()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(NoteCell.id, forIndexPath: indexPath) as! NoteCell
        let note = game.getNote(indexPath.row)
        cell.setContent(note.description())
        return cell
    }
    
    @IBAction func onGuess(sender: UIButton) {
        
        let labelText = sender.titleLabel!.text!
        let note = Note.fromName(labelText)
        game.guess(note)
        
        displayGuessFeedback(sender)
        
        if (!game.isOver()) {
            // display next note from game
            diagram.setPosition(game.currentPosition())
            diagram.setNeedsDisplay()
        }
        else {
            
            if (game.questionsAnsweredCorrectlyCount() != game.questionsAnsweredCount()) {
                diagram.setPositions(game.incorrectPositions(), color: UIColor.redColor(), textColor: UIColor.whiteColor())
            }
            else {
                diagram.setPositions(game.correctPositions(), color: UIColor.greenColor())
            }
            diagram.showLabels = true
            diagram.setNeedsDisplay()
            buttons.hidden = true
            
            
            
            //alert.show()
        }
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        if (game.isOver())
        {
            reset()
        }
    }
    
    private func reset() {
        game = NotesGame(history: history)
        diagram.setPosition(game.currentPosition())
        diagram.showLabels = false
        diagram.setNeedsDisplay()
        buttons.hidden = false
    }
    
    func displayGuessFeedback(sender: UIButton) {
        
        let currentColor = sender.backgroundColor
        
        // Highlight button green/red based on if answer is correct
        if (game.isLastGuessCorrect()) {
            sender.backgroundColor = UIColor.greenColor()
        } else {
            sender.backgroundColor = UIColor.redColor()
        
        
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 8
            animation.autoreverses = true
        
            CGPointMake(sender.center.x - 20, sender.center.y)
        
            animation.fromValue = NSValue(CGPoint: CGPointMake(sender.center.x - 2.5, sender.center.y))
            animation.toValue = NSValue(CGPoint: CGPointMake(sender.center.x + 2.5, sender.center.y))
        
            sender.layer.addAnimation(animation, forKey: "position")
        }
        
        // Fade back to current color
        UIView.animateWithDuration(0.8, animations:
            { () -> Void in sender.backgroundColor = currentColor})
    }
}



