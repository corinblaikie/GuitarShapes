import Foundation
import XCTest

class NotesGameHistoryTests :XCTestCase {
    
    func testGetScoreFor() {
        let history = NotesGameHistory()
        let position = FingerPosition(stringIndex: 0, fretIndex: 0)
        history.add(PositionAnswer(positionAsked: position, correct: true))
        history.add(PositionAnswer(positionAsked: position, correct: true))
        history.add(PositionAnswer(positionAsked: position, correct: false))
        
        let score = history.getScoreFor(position)
        
        XCTAssertEqual(score, 2.0/3.0)
    }
    
    func testGetPositionsByLowestScore_FiltersOutPositionsThatHaveOnlyBeenAnsweredCorrectly() {
        let history = NotesGameHistory()
        let correctPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        let incorrectPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        history.add(PositionAnswer(positionAsked: correctPosition, correct: true))
        history.add(PositionAnswer(positionAsked: incorrectPosition, correct: false))
        
        let positions = history.getPositionsByLowestScore()
        
        XCTAssertEqual(positions.count, 1)
        XCTAssertEqual(positions[0], incorrectPosition)
    }
    
    func testGetPositionsByLowestScore_OrdersPositionsByWorstAnswersFirst() {
        let history = NotesGameHistory()
        
        let fullWrongPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        let halfWrongPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        history.add(PositionAnswer(positionAsked: fullWrongPosition, correct: false))
        history.add(PositionAnswer(positionAsked: fullWrongPosition, correct: false))
        
        history.add(PositionAnswer(positionAsked: halfWrongPosition, correct: false))
        history.add(PositionAnswer(positionAsked: halfWrongPosition, correct: true))
        
        
        let positions = history.getPositionsByLowestScore()
        
        XCTAssertEqual(positions.count, 2)
        XCTAssertEqual(positions[0], fullWrongPosition)
        XCTAssertEqual(positions[1], halfWrongPosition)
    }

}