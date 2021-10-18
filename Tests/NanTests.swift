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
        let a = Matrix(row: [Double.nan, .nan, .nan])
        let b = Matrix(value: Double.nan, 3)
        XCTAssertEqual(a, b)

        let array: [[Double]] = MatLab.nan(4)
        array.forEach { sub in
            sub.forEach { val in
                XCTAssertTrue(val.isNaN)
            }
        }

        // Matrix
        let c = MatLab.nan(2, 3, 4)
        c.allValues.forEach { val in
            XCTAssertTrue(val.isNaN)
        }
    }

    func testNanSpecial() throws {
        // Array
        let array: [[Double]] = MatLab.nan(2)
        array.forEach { sub in
            sub.forEach { val in
                XCTAssertTrue(val.isNaN)
            }
        }

        // Matrix
        XCTAssertEqual(MatLab.nan([2]), Matrix<Double>(value: .nan, [2]))
        XCTAssertEqual(MatLab.nan(2, 0), Matrix<Double>(value: .nan, 2, 0))
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
