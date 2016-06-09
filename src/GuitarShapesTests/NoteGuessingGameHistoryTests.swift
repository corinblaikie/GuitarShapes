import Foundation
import XCTest

class NoteGuessingGameHistoryTests :XCTestCase {
    
    func testItCalculatesScoreCorrectly() {
        let history = NoteGuessingGameHistory()
        let position = FingerPosition(stringIndex: 0, fretIndex: 0)
        history.Add(Answer(positionAsked: position, correct: true))
        history.Add(Answer(positionAsked: position, correct: true))
        history.Add(Answer(positionAsked: position, correct: false))
        
        let score = history.GetScoreFor(position)
        
        XCTAssertEqual(score, 2.0/3.0)
    }
}