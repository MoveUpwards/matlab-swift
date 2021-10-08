//
//  ZerosTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class ZerosTests: XCTestCase {
    func testZeros() throws {
        // Array
        XCTAssertEqual(MatLab.zeros(4), [[0.0, 0.0, 0.0, 0.0],
                                         [0.0, 0.0, 0.0, 0.0],
                                         [0.0, 0.0, 0.0, 0.0],
                                         [0.0, 0.0, 0.0, 0.0]])

        // Matrix
        XCTAssertEqual(MatLab.zeros(2, 3, 4), Matrix<Double>(2, 3, 4))
    }

    func testZerosSpecial() throws {
        // Array
        XCTAssertEqual(MatLab.zeros(2), [[0.0, 0.0], [0.0, 0.0]])
        // Matrix
        XCTAssertEqual(MatLab.zeros([2]), Matrix<Double>([2]))
        XCTAssertEqual(MatLab.zeros(2, 0), Matrix<Double>(2, 0))
    }

    func testZerosError() throws {
        // Array
        XCTAssertEqual(MatLab.zeros(0) as [[Double]], [])
        XCTAssertEqual(MatLab.zeros(-1) as [[Double]], [])
        // Matrix
        XCTAssertEqual(MatLab.zeros(2, 0, 1), Matrix<Double>(2, 0, 1))
        XCTAssertEqual(MatLab.zeros(2, -1, 1), Matrix<Double>(2, -1, 1))
    }
}
