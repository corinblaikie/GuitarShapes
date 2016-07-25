import Foundation
import XCTest

class NotesGameTests: XCTestCase {
    
    func testGameNotOver() {
        
        let game = NotesGame(history: NotesGameHistory())
        
        XCTAssertEqual(false, game.isOver())
    }
    
    func testCorrectAnswer() {
        
        let game = NotesGame(history: NotesGameHistory())
        
        let correctPosition = game.currentPosition()
        game.guess(correctPosition.note)
        
        XCTAssertTrue(game.isLastGuessCorrect())
        
    }
    
    func testIncorrectAnswer() {
        
        let game = NotesGame(history: NotesGameHistory())
        
        let correctPosition = game.currentPosition()
        
        let incorrectAnswer = [Note.a(), Note.aSharp()].filter { $0 != correctPosition.note }.first
        
        game.guess(incorrectAnswer!)
        
        XCTAssertFalse(game.isLastGuessCorrect())
        
    }
    
    func testGameOver() {
        let game = NotesGame(history: NotesGameHistory())
        while game.questionsAnsweredCount() < game.questionsCount() {
            game.guess(Note.a())
        }
        
        XCTAssertTrue(game.isOver())
    }
    
    func testNoteCount() {
        XCTAssertEqual(12, NotesGame(history: NotesGameHistory()
            ).noteCount())
    }
    
}
