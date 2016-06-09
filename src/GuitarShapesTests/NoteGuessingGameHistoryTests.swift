import Foundation
import XCTest

class NoteGuessingGameHistoryTests :XCTestCase {
    
    func testGetScoreFor() {
        let history = NoteGuessingGameHistory()
        let position = FingerPosition(stringIndex: 0, fretIndex: 0)
        history.Add(PositionAnswer(positionAsked: position, correct: true))
        history.Add(PositionAnswer(positionAsked: position, correct: true))
        history.Add(PositionAnswer(positionAsked: position, correct: false))
        
        let score = history.GetScoreFor(position)
        
        XCTAssertEqual(score, 2.0/3.0)
    }
    
    func testGetPositionsByLowestScore_FiltersOutPositionsThatHaveOnlyBeenAnsweredCorrectly() {
        let history = NoteGuessingGameHistory()
        let correctPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        let incorrectPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        history.Add(PositionAnswer(positionAsked: correctPosition, correct: true))
        history.Add(PositionAnswer(positionAsked: incorrectPosition, correct: false))
        
        let positions = history.GetPositionsByLowestScore()
        
        XCTAssertEqual(positions.count, 1)
        XCTAssertEqual(positions[0], incorrectPosition)
    }
    
    func testGetPositionsByLowestScore_OrdersPositionsByWorstAnswersFirst() {
        let history = NoteGuessingGameHistory()
        
        let fullWrongPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        let halfWrongPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        history.Add(PositionAnswer(positionAsked: fullWrongPosition, correct: false))
        history.Add(PositionAnswer(positionAsked: fullWrongPosition, correct: false))
        
        history.Add(PositionAnswer(positionAsked: halfWrongPosition, correct: false))
        history.Add(PositionAnswer(positionAsked: halfWrongPosition, correct: true))
        
        
        let positions = history.GetPositionsByLowestScore()
        
        XCTAssertEqual(positions.count, 2)
        XCTAssertEqual(positions[0], fullWrongPosition)
        XCTAssertEqual(positions[1], halfWrongPosition)
    }

}