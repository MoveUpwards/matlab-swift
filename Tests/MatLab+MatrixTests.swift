//
//  MatLab+MatrixTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 21/10/2021.
//

import XCTest
@testable import MatLabSwift

class MatLab_MatrixTests: XCTestCase {
    func testPlus() throws {
        let a = Matrix(column: [1, 2, 3])
        let b = Matrix(row: [1, 2, 3, 4, 5])
        XCTAssertEqual(MatLab.plus(a, b), Matrix(array: [[2, 3, 4, 5, 6],
                                                        [3, 4, 5, 6, 7],
                                                        [4, 5, 6, 7, 8]]))
        XCTAssertEqual(MatLab.plus(b, a), Matrix(array: [[2, 3, 4, 5, 6],
                                                         [3, 4, 5, 6, 7],
                                                         [4, 5, 6, 7, 8]]))

        let c = Matrix(array: [[1, 2, 3, 4, 5],
                               [6, 7, 8, 9, 10],
                               [11, 12, 13, 14, 15]])
        XCTAssertEqual(MatLab.plus(c, a), Matrix(array: [[2, 3, 4, 5, 6],
                                                         [8, 9, 10, 11, 12],
                                                         [14, 15, 16, 17, 18]]))
        XCTAssertEqual(MatLab.plus(c, b), Matrix()) // Not possible => Empty Matrix

        let x = Matrix(array: [[2.0, 3.0], [4.0, 5.0]])
        let y = Matrix(array: [[1.0, 2.0], [8.0, 2.5]])
        XCTAssertEqual(MatLab.plus(x, y), Matrix(array: [[3.0, 5.0], [12.0, 7.5]]))
        XCTAssertEqual(MatLab.plus(x, y), x + y) // Normal matrix addition
    }

    func testMinus() throws {
        let a = Matrix(column: [1, 2, 3])
        let b = Matrix(row: [1, 2, 3, 4, 5])
        XCTAssertEqual(MatLab.minus(a, b), Matrix(array: [[0, -1, -2, -3, -4],
                                                          [1, 0, -1, -2, -3],
                                                          [2, 1, 0, -1, -2]]))
        XCTAssertEqual(MatLab.minus(b, a), Matrix(array: [[0, 1, 2, 3, 4],
                                                          [-1, 0, 1, 2, 3],
                                                          [-2, -1, 0, 1, 2]]))

        let c = Matrix(array: [[1, 2, 3, 4, 5],
                               [6, 7, 8, 9, 10],
                               [11, 12, 13, 14, 15]])
        XCTAssertEqual(MatLab.minus(c, a), Matrix(array: [[0, 1, 2, 3, 4],
                                                          [4, 5, 6, 7, 8],
                                                          [8, 9, 10, 11, 12]]))
        XCTAssertEqual(MatLab.minus(c, b), Matrix(array: [[0, 0, 0, 0, 0],
                                                          [5, 5, 5, 5, 5],
                                                          [10, 10, 10, 10, 10]]))
    }

    func testMtimes() throws {
        let a = Matrix(row: [1, 1, 0, 0])
        let b = Matrix(column: [1, 2, 3, 4])
        XCTAssertEqual(MatLab.mtimes(a, b), Matrix(array: [[1, 1, 0, 0],
                                                           [2, 2, 0, 0],
                                                           [3, 3, 0, 0],
                                                           [4, 4, 0, 0]]))
    }
}
