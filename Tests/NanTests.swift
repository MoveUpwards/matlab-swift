//
//  NanTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class NanTests: XCTestCase {
    func testNan() throws {
        // Array
        let array: [[Double]] = MatLab.nan(4)
        array.forEach { sub in
            sub.forEach { val in
                XCTAssertTrue(val >= 0.0 && val <= 1.0)
            }
        }

        // Matrix
        XCTAssertEqual(MatLab.nan(2, 3, 4), Matrix<Double>(2, 3, 4))
    }

    func testNanSpecial() throws {
        // Array
        XCTAssertEqual(MatLab.nan(2), [[0.0, 0.0], [0.0, 0.0]])
        // Matrix
        XCTAssertEqual(MatLab.nan([2]), Matrix<Double>([2]))
        XCTAssertEqual(MatLab.nan(2, 0), Matrix<Double>(2, 0))
    }

    func testNanError() throws {
        // Array
        XCTAssertEqual(MatLab.nan(0) as [[Double]], [])
        XCTAssertEqual(MatLab.nan(-1) as [[Double]], [])
        // Matrix
        XCTAssertEqual(MatLab.nan(2, 0, 1), Matrix<Double>()) // If dimension of 0 or negative, return an empty matrix
        XCTAssertEqual(MatLab.nan(2, -1, 1), Matrix<Double>())
    }
}
