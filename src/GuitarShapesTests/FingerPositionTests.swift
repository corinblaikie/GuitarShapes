import UIKit
import XCTest

class FingerPositionTests: XCTestCase {
    
    
    func testNoteShouldBeCorrectForAnOpenEString() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: -1)
        
        XCTAssertEqual(Note.e(), position.note)
    }
    
    func testIndexShouldBeCorrectForAnOpenEString() {
        
        let position:FingerPosition = FingerPosition(guitarString: Guitar.lowEString, note: Note.e())
        
        XCTAssertEqual(Note.e(), position.note)
        XCTAssertEqual(-1, position.fretIndex)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFret() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 0)
        
        XCTAssertEqual(Note.f(), position.note)
    }
    
    func testIndexShouldBeCorrectForAnEStringWithF() {
        
        let position:FingerPosition = FingerPosition(guitarString: Guitar.lowEString, note: Note.f())
        
        XCTAssertEqual(Note.f(), position.note)
        XCTAssertEqual(0, position.fretIndex)
    }
    
    func testNoteShouldBeCorrectForAnEStringWithFretOverAnOctaveHigher() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 0, fretIndex: 14)
        
        XCTAssertEqual(Note.g(), position.note)
    }
    
    func testNoteShouldBeCorrectForAnOpenAString() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: -1)
        
        XCTAssertEqual(Note.a(), position.note)
    }
    
    func testNoteShouldBeCorrectForAnAStringWithFret() {
        
        let position:FingerPosition = FingerPosition(stringIndex: 1, fretIndex: 0)
        
        XCTAssertEqual(Note.aSharp(), position.note)
    }
}
