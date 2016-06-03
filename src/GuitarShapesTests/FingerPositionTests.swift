import UIKit
import XCTest

class FingerPositionTests: XCTestCase {
    
    func testNoteShouldBeCorrectForAnOpenEString() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: -1)
        
        XCTAssertEqual("E", position.note)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFret() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        
        XCTAssertEqual("F", position.note)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFretOverAnOctaveHigher() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 14)
        
        XCTAssertEqual("G", position.note)
    }
    
    func testNoteShouldBeCorrectForAnOpenAString() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: -1)
        
        XCTAssertEqual("A", position.note)
    }
    
    func testNoteShouldBeCorrectForAnAStringWithFret() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        XCTAssertEqual("A#", position.note)
    }
}
