import Foundation
import XCTest

class ScaleNoteTests :XCTestCase {
    
    func testMaskedDescription() {
        let scale = CMajorScale() // "C, D, E, F, G, A, B, C"
        let scaleNote = ScaleNote(scale: scale, position: 1)
        
        let expectedMaskedScription = "C, _, E, F, G, A, B, C"
        XCTAssertEqual(expectedMaskedScription, scaleNote.maskedDescription())
    }
}