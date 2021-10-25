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
        XCTAssertTrue(a.values == [0.0, 0.0, 0.0])

        let b = Matrix<Int>(6) // Will make 1x6 matrix
        XCTAssert(b.subMatrices.isEmpty)
        XCTAssertTrue(b.values == [0, 0, 0, 0, 0, 0])

        let c = Matrix(value: Float(5.0), 5) // Will make 1x5 matrix
        XCTAssert(c.subMatrices.isEmpty)
        XCTAssertTrue(c.values == [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))

        let d = Matrix(row: [3, 2, 6]) // Will make 1x3 matrix
        var d2 = Matrix<Int>(3)
        d2.values[0] = 3
        d2.values[1] = 2
        d2.values[2] = 6
        XCTAssertEqual(d, d2)

        let e = Matrix(column: [2, 1, 4, -1]) // Will make 4x1 matrix
        var e2 = Matrix<Int>(4, 1)
        e2[0, 0] = 2
        e2[1, 0] = 1
        e2[2, 0] = 4
        e2[3, 0] = -1
        XCTAssertEqual(e, e2)
    }

    func testMatrix2D() throws {
        let a = Matrix<Double>(4, 2)
        XCTAssertEqual(a.subMatrices.count, 4)
        XCTAssertTrue(a.subMatrices[0].values == [0.0, 0.0])
        XCTAssertTrue(a.subMatrices[1].values == [0.0, 0.0])
        XCTAssertTrue(a.subMatrices[2].values == [0.0, 0.0])
        XCTAssertTrue(a.subMatrices[3].values == [0.0, 0.0])

        let b = Matrix<Int>(1, 6)
        XCTAssertEqual(b.subMatrices.count, 0)
        XCTAssertEqual(b.values.count, 6)
        XCTAssertTrue(b.values == [0, 0, 0, 0, 0, 0])

        let c = Matrix(value: Float(5.0), 3, 5)
        XCTAssertEqual(c.subMatrices.count, 3)
        XCTAssertTrue(c.subMatrices[0].values == [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))
        XCTAssertTrue(c.subMatrices[1].values == [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))
        XCTAssertTrue(c.subMatrices[2].values == [5.0, 5.0, 5.0, 5.0, 5.0].map(Float.init))

        let d = Matrix(array: [[2, 3, 6],
                              [4, 1, 5]])
        var d2 = Matrix<Int>(2, 3)
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
        XCTAssertTrue(a.subMatrices[1].subMatrices[2].values == [0.0, 0.0, 0.0, 0.0])
    }

    func testMatrixND() throws {
        let a = Matrix<Double>(2, 3, 4, 5, 6)
        XCTAssertEqual(a.subMatrices.count, 2)
        XCTAssertEqual(a.subMatrices[0].subMatrices.count, 3)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices.count, 4)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices[0].subMatrices.count, 5)
        XCTAssertEqual(a.subMatrices[0].subMatrices[0].subMatrices[0].subMatrices[0].values.count, 6)
        XCTAssertTrue(a.subMatrices[1].subMatrices[2].subMatrices[3].subMatrices[4].values == [0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    }

    func testMatrixSubscript() throws {
        var a = Matrix<Int>(3, 3, 3)
        XCTAssertEqual(a[1][1, 1], 0)

        a[1][1, 1] = 10
        XCTAssertEqual(a[1][1, 1], 10)

        var b = Matrix<Int>(3, 3)
        b[1, 1] = 10
        XCTAssertEqual(a[1], b)

        // 1 2 3 4
        // 5 6 7 8
        var c = Matrix<Int>(2, 4)
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
        var c = Matrix<Int>(3, 3)
        c[0, 0] = 1
        c[1, 1] = 1
        c[2, 2] = 1

        XCTAssertNotEqual(a, b)
        XCTAssertNotEqual(a, c)

        let d = MatLab.diag([1, 1, 1])
        XCTAssertEqual(c, d)
    }

    func testMatrixCopy() throws {
        var a = Matrix<Int>(2, 3, 4, 5)
        let b = a
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

    func testMatrixToArray2D() throws {
        let a = Matrix(array: [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(a.rows, [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(a.columns, [[1, 3, 5], [2, 4, 6]])

        let b = Matrix(value: 2.0, 1, 4)
        XCTAssertEqual(b.rows, [[2.0, 2.0, 2.0, 2.0]])
        XCTAssertEqual(b.columns, [[2.0], [2.0], [2.0], [2.0]])

        let c = Matrix(value: Float(-1), 3, 1)
        XCTAssertEqual(c.rows, [[-1.0], [-1.0], [-1.0]])
        XCTAssertEqual(c.columns, [[-1.0, -1.0, -1.0]])
    }

    func testOperator() throws {
        let a = Matrix(value: 1.5, 2, 4)
        XCTAssertEqual(a + 2.0, Matrix(value: 3.5, 2, 4))
        XCTAssertEqual(a - 2.0, Matrix(value: -0.5, 2, 4))
        XCTAssertEqual(a * 2.0, Matrix(value: 3.0, 2, 4))
        XCTAssertEqual(a / 2.0, Matrix(value: 0.75, 2, 4))

        let b = Matrix(value: 3.5, 2, 4)
        XCTAssertEqual(a + b, Matrix(value: 5.0, 2, 4))
        XCTAssertEqual(a - b, Matrix(value: -2.0, 2, 4))
    }

    func testDivision() throws {
        let a = Matrix(array: [[2.0, 3.0], [4.0, 5.0]])
        let b = Matrix(array: [[1.0, 2.0], [8.0, 2.5]])
        XCTAssertEqual(a / b, Matrix(array: [[1.4074074074074074, 0.07407407407407407],
                                             [2.2222222222222223, 0.2222222222222222]]))

        let c = Matrix(array: [[13, 26], [39, 13]])
        let d = Matrix(array: [[7, 4], [2, 3]])
        XCTAssertEqual(c.asDouble / d.asDouble, Matrix(array: [[-1.0, 10.000000000000002], [7.0, -4.999999999999999]]))
        XCTAssertEqual(c / d, Matrix(array: [[-1.0, 10.000000000000002], [7.0, -4.999999999999999]]))

        let e = Matrix(array: [[2, 19, 8]])
        let f = Matrix(array: [[1, 1, 3], [2, 0, 4], [-1, 6, -1]])
        XCTAssertEqual(e / f, Matrix(array: [[1.0, 2.0, 3.0000000000000004]]))
    }

    func testMap() throws {
        let a = Matrix(array: [[1, 2, 3], [4, 5, 6]]) // 2x3 Matrix
        let b = a.map({ row, col, value in
            value * 2
        })
        XCTAssertEqual(a, Matrix(array: [[1, 2, 3], [4, 5, 6]]))
        XCTAssertEqual(b, Matrix(array: [[2, 4, 6], [8, 10, 12]]))
    }

    func testRowsColumnsModification() throws {
        var a: Matrix<Int> = MatLab.eye(4)
        XCTAssertEqual(a, Matrix(array: [[1, 0, 0, 0],
                                         [0, 1, 0, 0],
                                         [0, 0, 1, 0],
                                         [0, 0, 0, 1]]))
        a.fillRow(1, value: 2)
        XCTAssertEqual(a, Matrix(array: [[1, 0, 0, 0],
                                         [2, 2, 2, 2],
                                         [0, 0, 1, 0],
                                         [0, 0, 0, 1]]))
        a.fillColumn(3, value: -1)
        XCTAssertEqual(a, Matrix(array: [[1, 0, 0, -1],
                                         [2, 2, 2, -1],
                                         [0, 0, 1, -1],
                                         [0, 0, 0, -1]]))
    }

    func testRemoveRowsSpecialCase() throws {
        var a = Matrix(array: [[1, 2, 3, 4],
                               [5, 6, 7, 8],
                               [9, 10, 11, 12]]) // Mat 3x4 (no special case)
        a.removeColumn(1)
        XCTAssertEqual(a, Matrix(array: [[1, 3, 4],
                                         [5, 7, 8],
                                         [9, 11, 12]])) // Mat 3x3 (no special case)

        a.removeRow(2)
        XCTAssertEqual(a, Matrix(array: [[1, 3, 4],
                                         [5, 7, 8]])) // Mat 2x3 (no special case)

        a.removeRow(0)
        XCTAssertEqual(a, Matrix(array: [[5, 7, 8]])) // Mat 1x3 (SPECIAL CASE)

        a.removeColumn(0)
        XCTAssertEqual(a, Matrix(array: [[7, 8]])) // Mat 1x2 (no special case)

        a.removeRow(0)
        XCTAssertEqual(a, Matrix(value: 0, 0, 0)) // Empty Matrix (SPECIAL CASE)
    }

    func testDeterminant() throws {
        XCTAssertEqual(Matrix(value: 0.0, 0, 0).determinant, 0.0) // Empty matrix
        XCTAssertEqual(Matrix(value: 22.0, 1, 1).determinant, 22.0) // Mat 1x1
        XCTAssertEqual(Matrix(value: -1.0, 1, 4).determinant, 0.0) // Mat 1x4 is not squared matrix

        XCTAssertEqual(MatLab.eye(3).determinant, 1.0)

        XCTAssertEqual(Matrix(array: [[3.0, 2.0, 0.0],
                                      [0.0, 0.0, 1.0],
                                      [2.0, -2.0, 1.0]]).determinant, 10.0)

        XCTAssertEqual(Matrix(array: [[-2, 2, -3], [-1, 1, 3], [2, 0, -1]]).determinant, 18)
        XCTAssertEqual(Matrix(array: [[3, 4], [8, 6]]).determinant, -14)
        XCTAssertEqual(Matrix(array: [[4, 3], [6, 8]]).determinant, 14)
        XCTAssertEqual(Matrix(array: [[6, 4, 2], [1, -2, 8], [1, 5, 7]]).determinant, -306)
        XCTAssertEqual(Matrix(array: [[Float(3), 6, 1, 3], [2, 3, 4, 8], [1, 3, 5, -7], [-10, 5, -1, 2]]).determinant, -4402.0)

        let a = Matrix(array: [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(a.determinant, a.transpose.determinant)
    }

    func testTranspose() throws {
        let a = Matrix(array: [[1, 2], [3, 4], [5, 6]])
        let b = Matrix(array: [[1, 3, 5], [2, 4, 6]])
        XCTAssertEqual(a.transpose, b)
        XCTAssertEqual(b.transpose, a)
    }

    func testCofactor() throws {
        let a = Matrix(array: [[3, 2, 0], [0, 0, 1], [2, -2, 1]])
        let aCofactor = Matrix(array: [[2, 2, 0], [-2, 3, 10], [2, -3, 0]])
        XCTAssertEqual(a.cofactor, aCofactor)

        let b = Matrix(array: [[1, 0, 1], [2, 4, 0], [3, 5, 6]])
        let bCofactor = Matrix(array: [[24, -12, -2], [5, 3, -5], [-4, 2, 4]])
        XCTAssertEqual(b.cofactor, bCofactor)

        let c = Matrix(array: [[1, 0, 1], [2, 4, 0], [3, 5, 6]])
        let cCofactor = Matrix(array: [[24, -12, -2], [5, 3, -5], [-4, 2, 4]])
        XCTAssertEqual(c.cofactor, cCofactor)
    }

    func testInverse() throws {
        let a = Matrix(array: [[3.0, 2.0, 0.0],
                               [0.0, 0.0, 1.0],
                               [2.0, -2.0, 1.0]])
        let aInverse = Matrix(array: [[0.2, -0.2, 0.2],
                                      [0.2, 0.30000000000000004, -0.30000000000000004],
                                      [0.0, 1.0, 0.0]])
        XCTAssertEqual(a.inverse, aInverse)
        XCTAssertEqual(a.dot(a.inverse), MatLab.eye(3))

        let b = Matrix(array: [[4, 3], [3, 2]])
        let bInverse = Matrix(array: [[-2, 3], [3, -4]])
//        XCTAssertEqual(b.inverse, bInverse)
//        XCTAssertEqual(b.dot(b.inverse), MatLab.eye(2))

        let c = Matrix(array: [[Float(1), 2], [4, 5]])
//        XCTAssertEqual(c.inverse, Matrix(array: [[-Float(5)/3, Float(2)/3], [Float(4)/3, -Float(1)/3]]))
//        XCTAssertEqual(c.dot(c.inverse), MatLab.eye(2))
    }

    func testDot() throws {
        let a = Matrix(array: [[1.0/6.0, 1.0/6.0], [-0.5, 0.5]])
        let b = Matrix(array: [[-3.0], [-6.0]])
        XCTAssertEqual(a.dot(b), Matrix(array: [[-1.5], [-1.5]]))
    }
}
