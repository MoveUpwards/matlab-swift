//
//  OnesTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class OnesTests: XCTestCase {
    func testOnes() throws {
        // Array
        XCTAssertEqual(MatLab.ones(4), [[1.0, 1.0, 1.0, 1.0],
                                         [1.0, 1.0, 1.0, 1.0],
                                         [1.0, 1.0, 1.0, 1.0],
                                         [1.0, 1.0, 1.0, 1.0]])

        // Matrix
        XCTAssertEqual(MatLab.ones(2, 3, 4), Matrix(value: 1.0, 2, 3, 4))
    }

    func testOnesSpecial() throws {
        // Array
        XCTAssertEqual(MatLab.ones(2), [[1.0, 1.0], [1.0, 1.0]])
        // Matrix
        XCTAssertEqual(MatLab.ones([2]), Matrix(value: 1.0, [2]))
        XCTAssertEqual(MatLab.ones(2, 0), Matrix<Double>(2, 0))
    }

    func testOnesError() throws {
        // Array
        XCTAssertEqual(MatLab.ones(0) as [[Double]], [])
        XCTAssertEqual(MatLab.ones(-1) as [[Double]], [])
        // Matrix
        XCTAssertEqual(MatLab.ones(2, 0, 1), Matrix<Double>()) // If dimension of 0 or negative, return an empty matrix
        XCTAssertEqual(MatLab.ones(2, -1, 1), Matrix<Double>())
    }
}
