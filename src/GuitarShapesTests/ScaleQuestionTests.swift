import Foundation
import XCTest

class ScaleQuestionTests :XCTestCase {
    
    func testMaskedDescription() {
        let scale = Scale.cMajor() // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        
        let expectedMaskedScription = "C, _, E, _, _, _, B"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testMaskedDescriptionAfterNotesAnswered() {
        let scale = Scale.cMajor() // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer("D") // first note not asked
        
        let expectedMaskedScription = "C, D, E, _, _, _, B"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testIsLastGuessCorrect() {
        let scale = Scale.cMajor() // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer("D") // first note not asked
        
        XCTAssertTrue(question.isLastGuessCorrect())
    }
    
    func testHasAnswersWhenTrue() {
        let scale = Scale.cMajor() // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer("D") // first note not asked
        
        XCTAssertTrue(question.hasAnswers())
    }
    
    func testHasAnswersWhenFalse() {
        let scale = Scale.cMajor() // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        
        XCTAssertFalse(question.hasAnswers())
    }
}