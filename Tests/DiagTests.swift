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
}
