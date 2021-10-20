//
//  SqueezeTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 07/10/2021.
//

import XCTest
@testable import MatLabSwift

class SqueezeTests: XCTestCase {
    func testSqueeze0D() throws {
        let a = Matrix(value: Int.zero)
        let b: Matrix<Int> = MatLab.zeros(0)
        XCTAssertEqual(a, b)
        XCTAssertEqual(MatLab.squeeze(a).dimensions, [0, 0])
        XCTAssertTrue(MatLab.squeeze(b).values == [])
    }

    func testSqueeze1D() throws {
        let a = Matrix(value: 1, 3) // dim: 3
        let b = Matrix(row: [1, 2, 3]) // dim: 3

        XCTAssertTrue(MatLab.squeeze(a).values == [1, 1, 1])
        XCTAssertTrue(MatLab.squeeze(b).values == [1, 2, 3])
    }

    func testSqueeze2D() throws {
        let a = Matrix(array: [[1, 2], [3, 4]]) // 2x2
        let b = Matrix(array: [[1], [2], [3]]) // 3x1
        let c = Matrix(value: 1, 10, 1) // 10x1

        XCTAssertEqual(MatLab.squeeze(a), a) // No dimension of 1
        XCTAssertEqual(MatLab.squeeze(b), Matrix(row: [1, 2, 3])) // dim: 3
        XCTAssertEqual(MatLab.squeeze(c), Matrix(row: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1])) // dim: 10
    }

    func testSqueeze3D() throws {
        var a = Matrix<Int>(2, 1, 2)
        a[0][0, 0] = 1
        a[0][0, 1] = 2
        a[1][0, 0] = 3
        a[1][0, 1] = 4
        XCTAssertEqual(MatLab.squeeze(a), Matrix(array: [[1, 2], [3, 4]]))

        var b = Matrix<Double>(1, 1, 3)
        b[0][0, 0] = 1.0
        b[0][0, 1] = 2.0
        b[0][0, 2] = 3.0
        XCTAssertEqual(MatLab.squeeze(b), Matrix(row: [1.0, 2.0, 3.0]))

        var c = Matrix<Int>(3, 1, 1)
        c[0][0, 0] = 1
        c[1][0, 0] = 2
        c[2][0, 0] = 3
        XCTAssertEqual(MatLab.squeeze(c), Matrix(row: [1, 2, 3]))
    }

    func testSqueezeND() throws {
        let a = Matrix<Int>(5, 1, 2, 3, 1, 1, 4, 2, 1, 1)
        XCTAssertEqual(MatLab.squeeze(a).dimensions, [5, 2, 3, 4, 2])

        var b = Matrix(value: 1, 5, 1, 5)
        b[4][0, 4] = 10
        let bSqueeze = MatLab.squeeze(b)
        XCTAssertEqual(b[4][0, 4], bSqueeze[4, 4])
    }
}
