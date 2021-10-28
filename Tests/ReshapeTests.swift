//
//  ReshapeTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 26/10/2021.
//

import XCTest
@testable import MatLabSwift

class ReshapeTests: XCTestCase {
    func test1DMatrix() throws {
        let a = Matrix(row: 1∶10)
        XCTAssertEqual(a.allValues, a.allColumnsValues)
        var b = Matrix(value: 0, 5, 2)
        b.allColumnsValues = Vector(1∶10)
        XCTAssertEqual(b, MatLab.horzcat(Matrix(column: [1, 2, 3, 4, 5]), Matrix(column: [6, 7, 8, 9, 10])))
    }

    func test2DMatrix() throws {
        let a = Matrix(array: [[1, 2, 3], [4, 5, 6]]) * (2 * MatLab.eye(3)) // [2 4 6; 8 10 12]
        let aReshape = Matrix(array: [[2, 10], [8, 6], [4, 12]])
        XCTAssertEqual(MatLab.reshape(a, 3, 2), aReshape)
    }

    func testReshape() throws {
        let a = Matrix(row: 1∶10)
        let aReshape = MatLab.horzcat(Matrix(column: [1, 2, 3, 4, 5]), Matrix(column: [6, 7, 8, 9, 10]))
        XCTAssertEqual(MatLab.reshape(a, [5, 2]), aReshape)

        let b: Matrix<Int> = MatLab.magic(4)
        XCTAssertEqual(MatLab.reshape(b, -1, 2), Matrix(array: [[16, 3],
                                                                [5, 10],
                                                                [9, 6],
                                                                [4, 15],
                                                                [2, 13],
                                                                [11, 8],
                                                                [7, 12],
                                                                [14, 1]]))

//        let d: Matrix<Int> = MatLab.zeros(3, 2, 3) // 3D Matrix
//        XCTAssertEqual(MatLab.reshape(d, 9, 2), Matrix(array: [[0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0],
//                                                               [0, 0]]))
//        XCTAssertEqual(MatLab.reshape(d, 4, -1), Matrix(array: [[0, 0, 0, 0],
//                                                                [0, 0, 0, 0],
//                                                                [0, 0, 0, 0],
//                                                                [0, 0, 0, 0]]))
    }
}
