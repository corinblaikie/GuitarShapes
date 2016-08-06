import Foundation
import XCTest

class ScalesGameTests :XCTestCase {
    
    func testScaleTheSameUntilAllNotesAreAnswered() {
        
        let game = ScalesGame()
        
        let initialScale = game.currentScale()
        
        game.guess("A")
        
        let scaleAfterGuess = game.currentScale()
        
        XCTAssertTrue(initialScale === scaleAfterGuess)
    }
    
    func testNotesAskedAreNeverNoteWithoutSharps() {
        let notesWithoutSharps = ["B", "E"]
        
        // Random values (12 (turns) * 12 (scales) * 2 (maj, min)
        // so test lots of times
        for _ in 0...10 {
            let game = ScalesGame()
            
            while (!game.isOver()) {
                let result = notesWithoutSharps.contains(game.currentScale().note())
                
                XCTAssertFalse(result)
                
                game.guess("A") // move to next turn
            }
        }
    }
    
    func testNotesAskedAreNeverTheFirstNoteInTheScale() {
        
        // Random values (12 (turns) * 12 (scales) * 2 (maj, min)
        // so test lots of times
        for _ in 0...10 {
            let game = ScalesGame()
            
            while (!game.isOver()) {
                let firstNoteInScale = game.currentScale().scale.notes().first!
                
                let noteAsked = game.currentScale().note()
                
                XCTAssert(noteAsked != firstNoteInScale)
                
                game.guess("A") // move to next turn
            }

        }
    }
    
    func testIsLastGuessCorrectWhenTrue() {
        let game = ScalesGame()
        let firstNote = game.currentScale().notesToAsk.first!.name()
        
        game.guess(firstNote)
        
        let result = game.isLastGuessCorrect()
        
        XCTAssertTrue(result)
    }
    
    func testIsLastGuessCorrectWhenFalse() {
        let game = ScalesGame()
        
        let incorrectNote = game.currentScale().notesToAsk[1].name()
        
        game.guess(incorrectNote)
        
        let result = game.isLastGuessCorrect()
        
        XCTAssertFalse(result)
    }
    
    func testIsLastGuessCorrectWhenFirstScaleCompleteWhenTrue() {
        let game = ScalesGame()
        
        // answer the first scale correctly
        for note in  game.currentScale().notesToAsk {
            game.guess(note.name())
        }
        
        XCTAssertTrue(game.isLastGuessCorrect())
        
        // answer first note of second scale correctly
        let correctNote = game.currentScale().notesToAsk.first!.name()
        game.guess(correctNote)
        
        XCTAssertTrue(game.isLastGuessCorrect())
    }
    
    func testIsLastGuessCorrectWhenFirstScaleCompleteWhenFalse() {
        let game = ScalesGame()
        
        // answer the first scale correctly
        for note in  game.currentScale().notesToAsk {
            game.guess(note.name())
        }
        
        XCTAssertTrue(game.isLastGuessCorrect())
        
        // answer first note of second scale correctly
        let incorrectNote = game.currentScale().notesToAsk[1]
        game.guess(incorrectNote.name())
        
        XCTAssertFalse(game.isLastGuessCorrect())
    }
}