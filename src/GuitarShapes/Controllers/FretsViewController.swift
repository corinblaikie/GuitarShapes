//
//  FretsViewController.swift
//  GuitarShapes
//
//  Created by Corin Blaikie on 01/02/2016.
//  Copyright (c) 2016 Corin Blaikie. All rights reserved.
//

import UIKit

class FretsViewController : UIViewController {
    
    var history = NotesGameHistory()
    
    var game:NotesGame! = nil
    
    var correctBackgroundColor = UIColor.greenColor()
    
    var correctForegroundColor = UIColor.blackColor()
    
    var incorrectBackgroundColor = UIColor.redColor()
    
    var incorrectForegroundColor = UIColor.whiteColor()
    
    @IBOutlet var turnLabel: UILabel!
    @IBOutlet var nodeLabel: UILabel!
    
    @IBOutlet weak var diagram: GuitarShapeDiagramUIView!
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        let location = sender.locationInView(diagram)
        
        let fretIndex = diagram.getFret(location.y)
        
        let guess = FingerPosition(stringIndex: game.currentPosition().stringIndex, fretIndex: fretIndex)
        game.guess(guess.note)
        
        let guessBackgroundColor = game.isLastGuessCorrect() ? correctBackgroundColor :  incorrectBackgroundColor
        let guessForegroundColor = game.isLastGuessCorrect() ? correctForegroundColor :  incorrectForegroundColor
        
        // highlight result
        diagram.setPosition(guess, color: guessBackgroundColor, textColor: guessForegroundColor)
        
        if (game.isOver()) {
            reset()
        }
        
        refresh()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        reset()
        refresh()
    }
    
    func reset() {
        game = NotesGame(history: self.history)
    }
    
    func refresh() {
        nodeLabel.text = game.currentPosition().note
        turnLabel.text = "\(game.turn())/\(game.totalTurns)"
        diagram.highlightString(game.currentPosition().stringIndex)
        diagram.setNeedsDisplay()
    }
}