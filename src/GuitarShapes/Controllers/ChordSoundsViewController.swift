//
//  ChordSoundsViewController.swift
//  GuitarShapes
//
//  Created by Corin Blaikie on 14/07/2015.
//  Copyright (c) 2015 Corin Blaikie. All rights reserved.
//

import UIKit
import AVFoundation

class ChordSoundsViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    var sounds = ChordSounds()
    
    var chordsToAsk:[String] = []
    
    var guesses:[String] = []
    var chordsAsked:[String] = []
    
    var chords:[String] = ["E", "Emin", "F", "G", "A", "Amin", "C", "D", "Dmin"]
    
    var chord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameRestart()
    }
    
    @IBAction func onPlayChordButtonPressed(sender: UIButton) {
        sounds.play(chord)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chords.count
    }
    
    @IBAction func onGuess(sender: UIButton) {
        var guess = sender.titleLabel?.text
        guesses.append(guess!)
        chordsAsked.append(chord)
        displayGuessFeedback(sender)
        
        if (isOver()) {
            var alert = UIAlertView()
            alert.title = "Game over"
            alert.addButtonWithTitle("Play again")
            alert.show()
            gameRestart()
            return
        }
        
        nextChord()
    }
    
    func gameRestart() {
        chordsToAsk = chords.shuffled()
        nextChord()
    }
    
    func nextChord() {
        chord = chordsToAsk.removeLast()
    }
    
    func isOver() -> Bool {
       return chordsToAsk.isEmpty
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(NoteCell.id, forIndexPath: indexPath) as! NoteCell
        var chord = chords[indexPath.row]
        cell.setContent(chord)
        cell.tag = indexPath.row + 1
        return cell
    }
    
    func displayGuessFeedback(sender: UIButton) {
        
        var currentColor = sender.backgroundColor
        
        // Highlight button green/red based on if answer is correct
        if (isLastGuessCorrect()) {
            sender.backgroundColor = UIColor.greenColor()
        } else {
            sender.backgroundColor = UIColor.redColor()
            
            var correctChord = chordsAsked.last
            var index = chords.indexOf(correctChord!)!
            var cell = view.viewWithTag(index + 1) as! NoteCell
            cell.button.backgroundColor = UIColor.greenColor()
            
            // Fade back to current color
            UIView.animateWithDuration(1, animations:
                { () -> Void in cell.button.backgroundColor = currentColor})

        }
        
        // Fade back to current color
        UIView.animateWithDuration(1, animations:
            { () -> Void in sender.backgroundColor = currentColor})
    }
    
    func isLastGuessCorrect() -> Bool {
        
        return guesses.last == chordsAsked.last
        
    }
}

class ChordSounds {
    
    var session = AVAudioSession.sharedInstance()
    var audioPlayer = AVAudioPlayer()
    
    init() {
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions:AVAudioSessionCategoryOptions.DefaultToSpeaker, error: nil)
    }

    func play(chord:String) {
        
        var testSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(chord, ofType: "m4a")!)
        audioPlayer = AVAudioPlayer(contentsOfURL: testSound, error: nil)
        audioPlayer.play()
        
    }
    
}