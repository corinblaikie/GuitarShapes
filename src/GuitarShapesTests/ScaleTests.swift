import Foundation
import XCTest

class ScaleTests :XCTestCase {
    
    func testCMajorScaleHasCorrectNotes() {
        let scale = CMajorScale()
        XCTAssertEqual("C, D, E, F, G, A, B, C", scale.notes())
    }
    
    func testGMajorScaleHasCorrectNotes() {
        let scale = GMajorScale()
        XCTAssertEqual("G, A, B, C, D, E, F#, G, A, B, C, D, E, F#, G", scale.notes())
    }
    
    func testDMajorScaleHasCorrectNotes() {
        let scale = DMajorScale()
        XCTAssertEqual("D, E, F#, G, A, B, C#, D", scale.notes())
    }
    
    func testAMajorScaleHasCorrectNotes() {
        let scale = AMajorScale()
        XCTAssertEqual("A, B, C#, D, E, F#, G#, A", scale.notes())
    }
    
    func testEMajorScaleHasCorrectNotes() {
        let scale = EMajorScale()
        XCTAssertEqual("E, F#, G#, A, B, C#, D#, E", scale.notes())
    }
}