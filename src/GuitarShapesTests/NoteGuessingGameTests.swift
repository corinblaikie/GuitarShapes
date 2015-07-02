import Foundation
import XCTest

class NotesGuessingGameTests: XCTestCase {
    
    func testGameNotOver() {
        
        var game = NotesGuessingGame()
        
        XCTAssertEqual(false, game.isOver())
    }
    
    func testCorrectAnswer() {
        
        var game = NotesGuessingGame()
        
        var correctPosition = game.currentPosition()
        game.guess(correctPosition.note)
        
        XCTAssertTrue(game.isLastGuessCorrect())
        
    }
    
    func testIncorrectAnswer() {
        
        var game = NotesGuessingGame()
        
        var correctPosition = game.currentPosition()
        
        var incorrectAnswer = ["A", "A#"].first { $0 != correctPosition.note }
        
        game.guess(incorrectAnswer!)
        
        XCTAssertFalse(game.isLastGuessCorrect())
        
    }
    
    func testGameOver() {
        var game = NotesGuessingGame()
        while game.questionsAnsweredCount() < game.questionsCount() {
            game.guess("A")
        }
        
        XCTAssertTrue(game.isOver())
    }
    
    func testNoteCount() {
        XCTAssertEqual(12, NotesGuessingGame().noteCount())
    }
    
}
