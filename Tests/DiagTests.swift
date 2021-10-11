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
}
