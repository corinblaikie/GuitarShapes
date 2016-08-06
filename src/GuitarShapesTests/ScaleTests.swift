import Foundation
import XCTest

class ScaleTests :XCTestCase {
    
    func testScaleEquality() {
        
        let scale1 = Scale.cMajor
        
        let scale2 = Scale.cMajor
        
        let result = scale1 == scale2
        
        XCTAssertTrue(result)
    }
    
    func testCMajorScaleHasCorrectPositions() {
        let scale = Scale.cMajor
        
        let expectedPositions = FingerPosition.fromIndexArray([(1,2), (2,-1), (2,1), (2,2), (3,-1), (3,1), (4,-1)])
        
        XCTAssertEqual(expectedPositions, scale.positions)
    }
    
    func testAFlatMajorScaleHasCorrectNotes() {
        let scale = Scale.aFlatMajor
        XCTAssertEqual("A♭, B♭, C, D♭, E♭, F, G", scale.description())
    }
    
    func testAMajorScaleHasCorrectNotes() {
        let scale = Scale.aMajor
        XCTAssertEqual("A, B, C♯, D, E, F♯, G♯", scale.description())
    }
    
    func testBFlatMajorScaleHasCorrectNotes() {
        let scale = Scale.bFlatMajor
        XCTAssertEqual("B♭, C, D, E♭, F, G, A", scale.description())
    }
    
    func testBMajorScaleHasCorrectNotes() {
        let scale = Scale.bMajor
        XCTAssertEqual("B, C♯, D♯, E, F♯, G♯, A♯", scale.description())
    }
    
    func testCMajorScaleHasCorrectNotes() {
        let scale = Scale.cMajor
        XCTAssertEqual("C, D, E, F, G, A, B", scale.description())
    }
    
    func testCSharpMajorScaleHasCorrectNotes() {
        let scale = Scale.cSharpMajor
        XCTAssertEqual("C♯, D♯, E♯, F♯, G♯, A♯, B♯", scale.description())
    }
    
    func testDFlatMajorScaleHasCorrectNotes() {
        let scale = Scale.dFlatMajor
        XCTAssertEqual("D♭, E♭, F, G♭, A♭, B♭, C", scale.description())
    }
    
    func testDMajorScaleHasCorrectNotes() {
        let scale = Scale.dMajor
        XCTAssertEqual("D, E, F♯, G, A, B, C♯", scale.description())
    }
    
    func testEFlatMajorScaleHasCorrectNotes() {
        let scale = Scale.eFlatMajor
        XCTAssertEqual("E♭, F, G, A♭, B♭, C, D", scale.description())
    }
    
    func testEMajorScaleHasCorrectNotes() {
        let scale = Scale.eMajor
        XCTAssertEqual("E, F♯, G♯, A, B, C♯, D♯", scale.description())
    }
    
    func testFMajorScaleHasCorrectNotes() {
        let scale = Scale.fMajor
        XCTAssertEqual("F, G, A, B♭, C, D, E", scale.description())
    }
    
    func testFSharpMajorScaleHasCorrectNotes() {
        let scale = Scale.fSharpMajor
        XCTAssertEqual("F♯, G♯, A♯, B, C♯, D♯, E♯", scale.description())
    }
    
    func testGFlatMajorScaleHasCorrectNotes() {
        let scale = Scale.gFlatMajor
        XCTAssertEqual("G♭, A♭, B♭, C♭, D♭, E♭, F", scale.description())
    }
    
    func testGMajorScaleHasCorrectNotes() {
        let scale = Scale.gMajor
        XCTAssertEqual("G, A, B, C, D, E, F♯", scale.description())
    }
}