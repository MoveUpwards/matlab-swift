//
//  LengthTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 05/11/2021.
//

import XCTest
@testable import MatLabSwift

class LengthTests: XCTestCase {
    func testLength() throws {
        // Number of Vector Elements
        let v = Vector(5∶10)
        XCTAssertEqual(MatLab.length(v), 6)

        // Length of Rectangular Matrix
        let x: Matrix<Int> = MatLab.zeros(3,7)
        XCTAssertEqual(MatLab.length(x), 7)

        // String Array
        let s = [["a", "b", "c"], ["d", "e", "f"]]
        XCTAssertEqual(MatLab.length(s), 3)

        // Single Array
        let a = [1, 2]
        XCTAssertEqual(MatLab.length(a), 2)

        // Scalar
        let b = 18
        XCTAssertEqual(MatLab.length(b), 1)
    }
}
