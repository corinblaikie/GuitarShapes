import Foundation
import XCTest

class ScaleTests :XCTestCase {
    
    func testCMajorScaleHasCorrectNotes() {
        let scale = CMajorScale()
        XCTAssertEqual("C, D, E, F, G, A, B, C", scale.description())
    }
    
    func testGMajorScaleHasCorrectNotes() {
        let scale = GMajorScale()
        XCTAssertEqual("G, A, B, C, D, E, F#, G, A, B, C, D, E, F#, G", scale.description())
    }
    
    func testDMajorScaleHasCorrectNotes() {
        let scale = DMajorScale()
        XCTAssertEqual("D, E, F#, G, A, B, C#, D", scale.description())
    }
    
    func testAMajorScaleHasCorrectNotes() {
        let scale = AMajorScale()
        XCTAssertEqual("A, B, C#, D, E, F#, G#, A", scale.description())
    }
    
    func testEMajorScaleHasCorrectNotes() {
        let scale = EMajorScale()
        XCTAssertEqual("E, F#, G#, A, B, C#, D#, E", scale.description())
    }
}