import UIKit
import XCTest

class FingerPositionTests: XCTestCase {
    
    func testNoteShouldBeCorrectForAnOpenEString() {
        
        var position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: -1)
        
        XCTAssertEqual("E", position.note)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFret() {
        
        var position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        
        XCTAssertEqual("F", position.note)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFretOverAnOctaveHigher() {
        
        var position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 14)
        
        XCTAssertEqual("G", position.note)
    }
    
    func testNoteShouldBeCorrectForAnOpenAString() {
        
        var position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: -1)
        
        XCTAssertEqual("A", position.note)
    }
    
    func testNoteShouldBeCorrectForAnAStringWithFret() {
        
        var position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        XCTAssertEqual("A#", position.note)
    }
}
