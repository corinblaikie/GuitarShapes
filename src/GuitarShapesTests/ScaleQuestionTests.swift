import Foundation
import XCTest

class ScaleQuestionTests :XCTestCase {
    
    func testMaskedDescription() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        
        let expectedMaskedScription = "C, _, E, _, _, _, B"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testFlatMaskedDescription() {
        let scale = Scale.gFlatMajor
        let question = ScaleQuestion(scale: scale)
        
        let expectedMaskedScription = "G♭, _, _, C♭, _, _, _"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testSharpMaskedDescription() {
        let scale = Scale.fSharpMajor
        let question = ScaleQuestion(scale: scale)
        
        let expectedMaskedScription = "F♯, _, _, B, _, _, _"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testMaskedDescriptionAfterNotesAnswered() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer(Note.fromName("D")) // first note not asked
        
        let expectedMaskedScription = "C, D, E, _, _, _, B"
        XCTAssertEqual(expectedMaskedScription, question.maskedDescription())
    }
    
    func testIsLastGuessCorrect() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer(Note.fromName("D")) // first note not asked
        
        XCTAssertTrue(question.isLastGuessCorrect())
    }
    
    func testHasAnswersWhenTrue() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        question.answer(Note.fromName("D")) // first note not asked
        
        XCTAssertTrue(question.hasAnswers())
    }
    
    func testHasAnswersWhenFalse() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        
        XCTAssertFalse(question.hasAnswers())
    }
    
    func testCorrectWhenTrue() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        let notesToAnswer = scale.notes().filter({$0 != Note.e() && $0 != Note.b() }).suffixFrom(1)
        
        for note in notesToAnswer {
            question.answer(note)
        }
        
        XCTAssertTrue(question.correct())
    }
    
    func testCorrectWhenFalse() {
        let scale = Scale.cMajor // "C, D, E, F, G, A, B, C"
        let question = ScaleQuestion(scale: scale)
        
        question.answer(Note.dSharp()) // Correct answer is D not D Sharp
        
        XCTAssertFalse(question.correct())
    }
}