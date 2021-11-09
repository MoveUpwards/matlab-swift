//
//  DiagTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 08/10/2021.
//

import XCTest
@testable import MatLabSwift

class DiagTests: XCTestCase {
    func testDiag() throws {
        let v = [2, 1, -1, -2, -5]
        let d = MatLab.diag(v)
        XCTAssertEqual(d, Matrix(array: [[2, 0, 0, 0, 0],
                                         [0, 1, 0, 0, 0],
                                         [0, 0, -1, 0, 0],
                                         [0, 0, 0, -2, 0],
                                         [0, 0, 0, 0, -5]]))
    }

    func testDiagK() throws {
        let v = [2, 1, -1, -2, -5]
        let d = MatLab.diag(v, 1)
        XCTAssertEqual(d, Matrix(array: [[0, 2, 0, 0, 0, 0],
                                         [0, 0, 1, 0, 0, 0],
                                         [0, 0, 0, -1, 0, 0],
                                         [0, 0, 0, 0, -2, 0],
                                         [0, 0, 0, 0, 0, -5],
                                         [0, 0, 0, 0, 0, 0]]))

        let e = MatLab.diag(v, -2)
        XCTAssertEqual(e, Matrix(array: [[0, 0, 0, 0, 0, 0, 0],
                                         [0, 0, 0, 0, 0, 0, 0],
                                         [2, 0, 0, 0, 0, 0, 0],
                                         [0, 1, 0, 0, 0, 0, 0],
                                         [0, 0, -1, 0, 0, 0, 0],
                                         [0, 0, 0, -2, 0, 0, 0],
                                         [0, 0, 0, 0, -5, 0, 0]]))

        XCTAssertEqual(MatLab.diag(v), MatLab.diag(v, 0))
    }

    func testDiagA() throws {
        let a = Matrix(array: [[9, 3, 10, 8, 7, 8],
                               [10, 6, 5, 10, 8, 1],
                               [2, 10, 9, 7, 8, 3],
                               [10, 10, 2, 1, 4, 1],
                               [7,  2, 5, 9, 7, 1],
                               [1, 10, 10, 10, 2, 9]])
        XCTAssertEqual(MatLab.diag(a), [9, 6, 9, 1, 7, 9])
        XCTAssertEqual(MatLab.diag(a, -1), [10, 10, 2, 9, 2])
    }
}
