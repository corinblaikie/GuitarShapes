import Foundation
import XCTest

class ScalesGameTests :XCTestCase {
    
    func testNotesAskedAreNeverNoteWithoutSharps() {
        let notesWithoutSharps = ["B", "E"]
        
        // Random values (12 (turns) * 12 (scales) * 2 (maj, min)
        // so test lots of times
        for _ in 0...1000 {
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
        for _ in 0...1000 {
            let game = ScalesGame()
            
            while (!game.isOver()) {
                let firstNoteInScale = game.currentScale().scale.notes().first!
                
                let noteAsked = game.currentScale().note()
                
                XCTAssertNotEqual(firstNoteInScale, noteAsked)
                
                game.guess("A") // move to next turn
            }

        }
    }
}