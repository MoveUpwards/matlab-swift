//
//  CatTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

import XCTest
@testable import MatLabSwift

class CatTests: XCTestCase {
    func testCat() throws {
        let a = Matrix(value: 1, 3, 3) // TODO: Add ones functions
        let b = MatLab.zeros(3) as Matrix<Int>
        let c1 = MatLab.cat(1, a, b)
        XCTAssertEqual(c1, Matrix(array: [[1, 1, 1],
                                          [1, 1, 1],
                                          [1, 1, 1],
                                          [0, 0, 0],
                                          [0, 0, 0],
                                          [0, 0, 0]]))
        let c2 = MatLab.cat(2, a, b)
        XCTAssertEqual(c2, Matrix(array: [[1, 1, 1, 0, 0, 0],
                                          [1, 1, 1, 0, 0, 0],
                                          [1, 1, 1, 0, 0, 0]]))

//        A = rand(2,3,4); // TODO: Add rand functions
//        B = rand(2,3,5);
//        C = cat(3,A,B); // TODO: Add 3D dimension
//        szC = size(C)
//        szC = 1×3
//        2     3     9
    }

    func testHorzcat() throws {
        let a = Matrix(array: [[1, 2], [3, 4]])
        let b = Matrix(array: [[4, 5, 6], [7, 8, 9]])
        // C = [A,B] // => See if possible or use other shortcut
        XCTAssertEqual(MatLab.horzcat(a, b), Matrix(array: [[1, 2, 4, 5, 6],
                                                            [3, 4, 7, 8, 9]]))

        XCTAssertEqual(MatLab.horzcat() as Matrix<Int>, MatLab.zeros(0))

//        let d = Matrix(array: [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
//        XCTAssertEqual(MatLab.horzcat(b, d), MatLab.zeros(0)) // Incompatible dimensions

//        let x = Matrix<Int>(2, 3, 4)
//        let y = Matrix<Int>(3, 4, 5)
//        XCTAssertEqual(MatLab.horzcat(x, y), MatLab.zeros(0))
    }

    func testVertcat() throws {
        let a = Matrix(array: [[1, 2, 3], [4, 5, 6]])
        let b = Matrix(array: [[7, 8, 9]])
        // C = [A; B] // => See if possible or use other shortcut
        XCTAssertEqual(MatLab.vertcat(a, b), Matrix(array: [[1, 2, 3],
                                                            [4, 5, 6],
                                                            [7, 8, 9]]))

        let bTest = Matrix(array: [7, 8, 9])
        print(b.dimensions, "!=", bTest.dimensions) // matrix 1x3 different of single array
        print(b[0, 0], "==", bTest.values[0])

        XCTAssertEqual(MatLab.vertcat() as Matrix<Int>, MatLab.zeros(0))
    }
}
