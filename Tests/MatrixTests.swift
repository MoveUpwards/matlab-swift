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

        let b = Matrix<Int>(1, 0)
        XCTAssert(b.subMatrices.isEmpty)
        XCTAssert(b.values.isEmpty)

        let c = Matrix(value: Float(5.0), 0)
        XCTAssert(c.subMatrices.isEmpty)
        XCTAssert(c.values.isEmpty)
    }

    func testMatrix1D() throws {
        let a = Matrix<Double>(3) // Will make 1x3 matrix
        XCTAssert(a.subMatrices.isEmpty)
        XCTAssertEqual(a.values, [0.0, 0.0, 0.0])

        let b = Matrix<Int>(6) // Will make 1x6 matrix
        XCTAssert(b.subMatrices.isEmpty)
        XCTAssertEqual(b.values, [0, 0, 0, 0, 0, 0])

        let c = Matrix(value: Float(5.0), 5) // Will make 1x5 matrix
        XCTAssert(c.subMatrices.isEmpty)
        XCTAssertEqual(c.values, [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))

        let d = Matrix(row: [3, 2, 6]) // Will make 1x3 matrix
        let d2 = Matrix<Int>(3)
        d2.values[0] = 3
        d2.values[1] = 2
        d2.values[2] = 6
        XCTAssertEqual(d, d2)

        let e = Matrix(column: [2, 1, 4, -1]) // Will make 4x1 matrix
        let e2 = Matrix<Int>(4, 1)
        e2[0, 0] = 2
        e2[1, 0] = 1
        e2[2, 0] = 4
        e2[3, 0] = -1
        XCTAssertEqual(e, e2)
    }

    func testMatrix2D() throws {
        let a = Matrix<Double>(4, 2)
        XCTAssertEqual(a.subMatrices.count, 4)
        XCTAssertEqual(a.subMatrices[0].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[1].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[2].values, [0.0, 0.0])
        XCTAssertEqual(a.subMatrices[3].values, [0.0, 0.0])

        let b = Matrix<Int>(1, 6)
        XCTAssertEqual(b.subMatrices.count, 0)
        XCTAssertEqual(b.values.count, 6)
        XCTAssertEqual(b.values, [0, 0, 0, 0, 0, 0])

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

        // 1 2 3 4
        // 5 6 7 8
        let c = Matrix<Int>(2, 4)
        c[0, 0] = 1; c[0, 1] = 2; c[0, 2] = 3; c[0, 3] = 4
        c[1, 0] = 5; c[1, 1] = 6; c[1, 2] = 7; c[1, 3] = 8
        XCTAssertEqual(c, Matrix(array: [[1, 2, 3, 4], [5, 6, 7, 8]]))
    }

//    func testWrongSubscriptToMatrix() throws {
//        let a = Matrix(value: Float(5.0)) // Empty matrix with dimension 0
//        XCTAssertEqual(a, a[0]) // 0 dimension return self
//        XCTAssertEqual(a, a[0][0][0])
//
//        let b = Matrix(value: Float(5.0), 5) // Matrix 1x5
//        XCTAssertEqual(b.values, b[0].values) // 0 dimension return self
//        XCTAssertEqual(b.values, b[0][0][0].values)
//
//        let c = Matrix(value: -2, 1) // Matrix 1x1
//        XCTAssertEqual(c.values, c[0][0][0].values) // 0 dimension return self
//    }
//
//    func testWrongSubscriptToArray() throws {
//        let a = Matrix(value: Float(5.0)) // Empty matrix with dimension 0
//        XCTAssertEqual(.zero, a[0, 0])
//
//        let b = Matrix(value: Float(5.0), 5) // Matrix 1x5
//        XCTAssertEqual(5.0, b[0, 0]) // => Expected access
//    }

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

    func testMatrixCopy() throws {
        let a = Matrix<Int>(2, 3, 4, 5)
        let b = a.copy()
        a[1][1][1, 1] = 10

        XCTAssertNotEqual(a[1][1][1, 1], b[1][1][1, 1])
        XCTAssertEqual(b, Matrix<Int>(2, 3, 4, 5))
    }

    func testColumnsRows() throws {
        let a = Matrix<Int>(array: [[1, 2, 3, 4], [5, 6, 7, 8]])
        XCTAssertEqual(a.columns(at: 1), Matrix<Int>(array: [[2], [6]]))
        XCTAssertEqual(a.columns(at: 1), Matrix(column: [2, 6]))
        XCTAssertEqual(a.rows(at: 1), Matrix<Int>(array: [[5, 6, 7, 8]]))
        XCTAssertEqual(a.rows(at: 1), Matrix(row: [5, 6, 7, 8]))

        let b = MatLab.vertcat([Matrix(row: [1, 2, 3]), Matrix(row: [4, 5, 6])])
        let bBis = MatLab.horzcat([Matrix(column: [1, 4]), Matrix(column: [2, 5]), Matrix(column: [3, 6])])
        XCTAssertEqual(b, bBis)

        let c = Matrix(array: [[1, 2, 3, 4],
                               [5, 6, 7, 8],
                               [9, 10, 11, 12],
                               [13, 14, 15, 16]])
        let d = Matrix(array: [[2, 3],
                               [6, 7],
                               [10, 11],
                               [14, 15]])
        let e = Matrix(array: [[9, 10, 11, 12],
                               [13, 14, 15, 16]])

        XCTAssertEqual(c.columns(at: 1, to: 2), d)
        XCTAssertEqual(c.columns(at: 2, to: 2), Matrix(column: [3, 7, 11, 15]))
        XCTAssertEqual(c.columns(at: 3, to: 2), MatLab.zeros(0))
        XCTAssertEqual(c.columns(at: -2), MatLab.zeros(0))
        XCTAssertEqual(c.columns(at: -2, to: -1), MatLab.zeros(0))

        XCTAssertEqual(c.rows(at: 2, to: 3), e)
        XCTAssertEqual(c.rows(at: 2, to: 2), Matrix(row: [9, 10, 11, 12]))
        XCTAssertEqual(c.rows(at: 3, to: 1), MatLab.zeros(0))
        XCTAssertEqual(c.rows(at: -2), MatLab.zeros(0))
        XCTAssertEqual(c.rows(at: -2, to: -1), MatLab.zeros(0))
    }

    func testMatrixSize() throws {
        let a = Matrix<Int>(2, 3, 4)
        XCTAssertEqual(a.valuesCount, 24)
        XCTAssertEqual(a.rowsCount, 2)
        XCTAssertEqual(a.columnsCount, 3)
    }

    func testOperator() throws {
        var a = Matrix(value: 1.5, 2, 4)
        a *= 2.0
        XCTAssertEqual(a, Matrix(value: 3.0, 2, 4))

        let b = Matrix(value: 3.5, 2, 4)
        XCTAssertEqual(a + b, Matrix(value: 5.0, 2, 4))
        XCTAssertEqual(a - b, Matrix(value: -2.0, 2, 4))
    }
}
