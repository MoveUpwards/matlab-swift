//
//  EyeTests.swift
//  MatLabSwiftTests
//
//  Created by Damien Noël Dubuisson on 14/10/2021.
//

import XCTest
@testable import MatLabSwift

class EyeTests: XCTestCase {
    func testEye() throws {
        XCTAssertEqual(MatLab.eye(4), MatLab.diag([1, 1, 1, 1]))

        XCTAssertEqual(MatLab.eye(2, 3), Matrix(array: [[1, 0, 0], [0, 1, 0]]))

        XCTAssertEqual(MatLab.eye([3, 1]), Matrix(array: [[1], [0], [0]]))
    }
}
