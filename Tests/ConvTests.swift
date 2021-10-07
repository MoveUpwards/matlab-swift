//
//  ConvTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class ConvTests: XCTestCase {
    // Test all cases from https://mathworks.com/help/matlab/ref/conv.html

    func testExampleOne() throws { // Polynomial Multiplication via Convolution
        let u: [Float] = [1, 0, 1]
        let v: [Float] = [2, 7]
        let w: [Float] = [2, 7, 2, 7]
        XCTAssertEqual(u.conv(v), w)
    }

    func testExampleTwo() throws { // Vector Convolution
        let u: [Float] = [1, 1, 1]
        let v: [Float] = [1, 1, 0, 0, 0, 1, 1]
        let w: [Float] = [1, 2, 2, 1, 0, 1, 2, 2, 1]
        XCTAssertEqual(u.conv(v), w)
    }

    func testExampleThree() throws { // Central Part of Convolution
        let u: [Float] = [-1, 2, 3, -2, 0, 1, 2]
        let v: [Float] = [2, 4, -1, 1]
        let w: [Float] = [15, 5, -9, 7, 6, 7, -1]
        XCTAssertEqual(u.conv(v, .same), w)
    }

    func testSomeExamplesOne() throws {
        // From https://stackoverflow.com/questions/53025435/convolution-using-matlabs-conv-function
        let u: [Float] = [1, 2, 1, 3]
        let v: [Float] = [2, 0, 1]
        XCTAssertEqual(u.conv(v, .full), [2, 4, 3, 8, 1, 3])
        XCTAssertEqual(u.conv(v, .same), [4, 3, 8, 1])

        let u2: [Float] = [1, 2, 1, 3, 1]
        let v2: [Float] = [2, 0, 1, 0]
        XCTAssertEqual(u2.conv(v2, .full), [2, 4, 3, 8, 3, 3, 1, 0])
        XCTAssertEqual(u2.conv(v2, .same), [3, 8, 3, 3, 1])

        let u3 = [0] + u + [0]
        XCTAssertEqual(u3.conv(v, .valid), u.conv(v, .same))

        // From https://forums.futura-sciences.com/mathematiques-superieur/298191-produit-de-convolution-matlab.html
        XCTAssertEqual([1, 1, 1].conv([1, 1, 1]), [1, 2, 3, 2, 1])
        XCTAssertEqual([1, 1, 2].conv([1, 2]), [1, 3, 4, 4])
    }

    func testSomeExamplesTwo() throws {
        let u1 = (1∶6).map(Float.init)
        let v1 = (1∶3).map(Float.init)
        let w1 = [1.0, 4.0, 10.0, 16.0, 22.0, 28.0, 27.0, 18.0].map(Float.init)

        XCTAssertEqual(u1.conv(v1), w1)

        let u2 = (1∶5).map(Float.init)
        let v2 = (1∶3).map(Float.init)

        let full = [1.0, 4.0, 10.0, 16.0, 22.0, 22.0, 15.0].map(Float.init)
        let same = [4.0, 10.0, 16.0, 22.0, 22.0].map(Float.init)
        let valid = [10.0, 16.0, 22.0].map(Float.init)

        XCTAssertEqual(u2.conv(v2, .full), full)
        XCTAssertEqual(u2.conv(v2, .same), same)
        XCTAssertEqual(u2.conv(v2, .valid), valid)
    }
}
