import UIKit
import XCTest

class FingerPositionTests: XCTestCase {
    
    
    func testNoteShouldBeCorrectForAnOpenEString() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: -1)
        
        XCTAssertEqual("E", position.note)
    }
    
    func testIndexShouldBeCorrectForAnOpenEString() {
        
        let position:FingerPosition = FingerPosition(string: Guitar.lowEString, note: "E")
        
        XCTAssertEqual("E", position.note)
        XCTAssertEqual(-1, position.fretIndex)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFret() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        
        XCTAssertEqual("F", position.note)
    }
    
    func testIndexShouldBeCorrectForAnEStringWithF() {
        
        let position:FingerPosition = FingerPosition(string: Guitar.lowEString, note: "F")
        
        XCTAssertEqual("F", position.note)
        XCTAssertEqual(0, position.fretIndex)
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
        
        XCTAssertEqual("A♯", position.note)
    }
}
