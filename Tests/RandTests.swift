//
//  RandTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class RandTests: XCTestCase {
    func testRand() throws {
        // Array
        let array: [[Double]] = MatLab.rand(4)
        array.forEach { sub in
            sub.forEach { val in
                XCTAssertTrue(val > 0.0 && val < 1.0) // Can be equal to 0.0 or 1.0 but to avoid zeros() and ones() to match
            }
        }

        // Matrix
        XCTAssertNotEqual(MatLab.rand(2, 3, 4), Matrix<Double>(2, 3, 4)) // right matrix is full of zeros
    }

    func testRandSpecial() throws {
        // Array
        XCTAssertNotEqual(MatLab.rand(2), [[0.0, 0.0], [0.0, 0.0]])
        // Matrix
        XCTAssertNotEqual(MatLab.rand([2]), Matrix<Double>([2]))
        XCTAssertEqual(MatLab.rand(2, 0), Matrix<Double>(2, 0))
    }

    func testRandError() throws {
        // Array
        XCTAssertEqual(MatLab.rand(0) as [[Double]], [])
        XCTAssertEqual(MatLab.rand(-1) as [[Double]], [])
        // Matrix
        XCTAssertEqual(MatLab.rand(2, 0, 1), Matrix<Double>()) // If dimension of 0 or negative, return an empty matrix
        XCTAssertEqual(MatLab.rand(2, -1, 1), Matrix<Double>())
    }
}
