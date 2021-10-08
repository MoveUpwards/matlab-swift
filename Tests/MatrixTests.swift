//
//  MatrixTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

import XCTest
@testable import MatLabSwift

class MatrixTests: XCTestCase {
    func testMatrix0D() throws {
        let a = Matrix<Double>()
        XCTAssert(a.subMatrices.isEmpty)
        XCTAssert(a.values.isEmpty)

        let b = Matrix<Int>()
        XCTAssert(b.subMatrices.isEmpty)
        XCTAssert(b.values.isEmpty)

        let c = Matrix(value: Float(5.0))
        XCTAssert(c.subMatrices.isEmpty)
        XCTAssert(c.values.isEmpty)
    }
    func testMatrix1D() throws {
        let a = Matrix<Double>(3)
        XCTAssert(a.subMatrices.isEmpty)
        XCTAssertEqual(a.values, [0.0, 0.0, 0.0])

        let b = Matrix<Int>(6)
        XCTAssert(b.subMatrices.isEmpty)
        XCTAssertEqual(b.values, [0, 0, 0, 0, 0, 0])

        let c = Matrix(value: Float(5.0), 5)
        XCTAssert(c.subMatrices.isEmpty)
        XCTAssertEqual(c.values, [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))

        let d = Matrix(array: [3, 2, 6])
        let d2 = Matrix<Int>(3)
        d2.values[0] = 3
        d2.values[1] = 2
        d2.values[2] = 6
        XCTAssertEqual(d, d2)
    }

    func testMatrix2D() throws {
        let a = Matrix<Double>(4, 2)
        XCTAssertEqual(a.subMatrices.count, 4)
        XCTAssertEqual(a.subMatrices[0].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[1].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[2].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[3].values, [0.0, 0.0])

        let b = Matrix<Int>(1, 6)
        XCTAssertEqual(b.subMatrices.count, 1)
        XCTAssertEqual(b.subMatrices[0].values, [0, 0, 0, 0, 0, 0])

        let c = Matrix(value: Float(5.0), 3, 5)
        XCTAssertEqual(c.subMatrices.count, 3)
        XCTAssertEqual(c.subMatrices[0].values, [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))
        XCTAssertEqual(c.subMatrices[1].values, [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))
        XCTAssertEqual(c.subMatrices[2].values, [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))

        let d = Matrix(array: [[2, 3, 6],
                              [4, 1, 5]])
        let d2 = Matrix<Int>(2, 3)
        d2[0, 0] = 2
        d2[0, 1] = 3
        d2[0, 2] = 6
        d2[1, 0] = 4
        d2[1, 1] = 1
        d2[1, 2] = 5
        XCTAssertEqual(d, d2)
    }

    func testMatrix3D() throws {
        let a = Matrix<Double>(2, 3, 4)
        XCTAssertEqual(a.subMatrices.count, 2)
        XCTAssertEqual(a.subMatrices[0].subMatrices.count, 3)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices.count, 0)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].values.count, 4)
        XCTAssertEqual(a.subMatrices[1].subMatrices[2].values, [0.0, 0.0, 0.0, 0.0])
    }

    func testMatrixND() throws {
        let a = Matrix<Double>(2, 3, 4, 5, 6)
        XCTAssertEqual(a.subMatrices.count, 2)
        XCTAssertEqual(a.subMatrices[0].subMatrices.count, 3)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices.count, 4)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices[0].subMatrices.count, 5)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices[0].subMatrices[0].values.count, 6)
        XCTAssertEqual(a.subMatrices[1].subMatrices[2].subMatrices[3].subMatrices[4].values,
                       [0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    }

    func testMatrixSubscript() throws {
        let a = Matrix<Int>(3, 3, 3)
        XCTAssertEqual(a[1][1, 1], 0)

        a[1][1, 1] = 10
        XCTAssertEqual(a[1][1, 1], 10)

        let b = Matrix<Int>(3, 3)
        b[1, 1] = 10
        XCTAssertEqual(a[1], b)
    }

    func testMatrixOperations() throws {
        let a = Matrix<Int>(2, 4)
        let b = Matrix<Int>(4, 2)
        let c = Matrix<Int>(3, 3)
        c[0, 0] = 1
        c[1, 1] = 1
        c[2, 2] = 1

        XCTAssertNotEqual(a, b)
        XCTAssertNotEqual(a, c)

        let d = MatLab.diag([1, 1, 1])
        XCTAssertEqual(c, d)
    }
}
