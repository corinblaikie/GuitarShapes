import UIKit
import SpriteKit

class ScalesGameViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var fingerPosition: FingerPosition!
    var game:ScalesGame = ScalesGame()
    
    @IBOutlet var buttons: UICollectionView!
    
    @IBOutlet var notesLabel: UILabel!
    
    @IBOutlet var scaleNameLabel: UILabel!
    
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("NoteCellId", forIndexPath: indexPath) as! NoteCell
        let note = game.getNote(indexPath.row)
        cell.setContent(note)
        return cell
    }
    
    @IBAction func onGuess(sender: UIButton) {
        
        if (!game.isOver())
        {
            let note = sender.titleLabel!.text!
            game.guess(note)
            displayGuessFeedback(sender)
            
        }
        
        if (!game.isOver() && !game.currentScale().hasAnswers()){
            refreshEndOfScale()
        }
        else {
            refresh()
        }
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        if (game.isOver())
        {
            reset()
        }
    }
    
    private func reset() {
        game = ScalesGame()
        refresh()
        buttons.hidden = false
    }
    
    private func refresh() {
        
        scaleNameLabel.text = game.scaleName()
        notesLabel.text = game.notesDescription()
    }
    
    private func refreshEndOfScale() {
        scaleNameLabel.text = game.previousScaleName()
        notesLabel.text = game.previousNotesDescription()
        
        let delay:Double = 2.0
        let wait = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(wait, dispatch_get_main_queue(), { self.refresh() })
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



