import Foundation
import XCTest

class ScaleTests :XCTestCase {
    
    func testCMajorScaleHasCorrectNotes() {
        var scale = CMajorScale()
        XCTAssertEqual("C, D, E, F, G, A, B, C", scale.notes())
    }
    
    func testGMajorScaleHasCorrectNotes() {
        var scale = GMajorScale()
        XCTAssertEqual("G, A, B, C, D, E, F#, G, A, B, C, D, E, F#, G", scale.notes())
    }
    
    func testDMajorScaleHasCorrectNotes() {
        var scale = DMajorScale()
        XCTAssertEqual("D, E, F#, G, A, B, C#, D", scale.notes())
    }
    
    func testAMajorScaleHasCorrectNotes() {
        var scale = AMajorScale()
        XCTAssertEqual("A, B, C#, D, E, F#, G#, A", scale.notes())
    }
    
    func testEMajorScaleHasCorrectNotes() {
        var scale = EMajorScale()
        XCTAssertEqual("E, F#, G#, A, B, C#, D#, E", scale.notes())
    }
}