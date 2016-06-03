import Foundation
import XCTest

class NotesGuessingGameTests: XCTestCase {
    
    func testGameNotOver() {
        
        let game = NotesGuessingGame()
        
        XCTAssertEqual(false, game.isOver())
    }
    
    func testCorrectAnswer() {
        
        let game = NotesGuessingGame()
        
        let correctPosition = game.currentPosition()
        game.guess(correctPosition.note)
        
        XCTAssertTrue(game.isLastGuessCorrect())
        
    }
    
    func testIncorrectAnswer() {
        
        let game = NotesGuessingGame()
        
        let correctPosition = game.currentPosition()
        
        let incorrectAnswer = ["A", "A#"].filter { $0 != correctPosition.note }.first
        
        game.guess(incorrectAnswer!)
        
        XCTAssertFalse(game.isLastGuessCorrect())
        
    }
    
    func testGameOver() {
        let game = NotesGuessingGame()
        while game.questionsAnsweredCount() < game.questionsCount() {
            game.guess("A")
        }
        
        XCTAssertTrue(game.isOver())
    }
    
    func testNoteCount() {
        XCTAssertEqual(12, NotesGuessingGame().noteCount())
    }
    
}
